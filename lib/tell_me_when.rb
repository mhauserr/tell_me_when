require "tell_me_when/version"
require "docopt"
require "green_shoes"
require 'nokogiri'
require 'open-uri'


module TellMeWhen
  class TellMeWhen
    VERSION = "0.0.1"
    DOC = <<DOCOPT

Usage:
  tell_me_when [--no-gui] [-c | -x] [-a | -d ] [--matches=<regex>] <site> <path_to_element>
  tell_me_when -h | --help
  tell_me_when -v | --version

Options:
  -h --help                      Show this screen.
  -v --version                   Show version.
  -c --css                       Search by css [default: true]
  -x --xpath                     Search by xpath
  -a --appears                   Display when value appears [default: true]
  -d --disappears                Display when value disappears
  -m=<regex> --matches=<regex>   Display only if the element matches the regex
  --no-gui                       Does not display the gui

DOCOPT

    def initialize(arguments, stdin)
      begin
        opts = Docopt::docopt(DOC, {:argv => arguments})
        if opts["--version"]
          puts VERSION
          return VERSION
        end
        @site = opts["<site>"]
        @path_to_element = opts["<path_to_element>"]
        tell_me_when(opts)
      rescue Docopt::Exit => e
        puts e.message
        return e.message
      end
    end

    def tell_me_when(opts)
      doc = Nokogiri::HTML(open(@site))
      if opts["--css"]
        css_opts(doc, opts)
      else
        xpath_opts(doc, opts)
      end
    end

    def css_opts(doc, opts)
      arr = doc.css(@path_to_element)
      handle_response(arr, opts)
    end

    def xpath_opts(doc, opts)
      arr = doc.xpath(@path_to_element)
      handle_response(arr, opts)
    end

    def handle_response(response, opts)
      test = (regex = opts["--matches"])? response.text.match(regex) : !response.empty?
      test = opts["--appears"]? test : !test
      if test
        if opts["--no-gui"]
          puts "woohoo"
        else
          alert <<TEXT
 You told me to tell you when #{@path_to_element} #{opts["--appears"]? "appears" : "disappears"} #{if !(opts["--matches"].nil?); "and matches #{opts["--matches"]} " end}on #{@site}"
TEXT
        end
      else
        puts "nope"
      end
    end
  end
end
