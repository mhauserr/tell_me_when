# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tell_me_when/version'

Gem::Specification.new do |spec|
  spec.name          = "tell_me_when"
  spec.version       = TellMeWhen::VERSION
  spec.authors       = ["Michael Hauser-Raspe"]
  spec.email         = ["michael.hauser-raspe@cantab.net"]
  spec.description   = %q{A gem to quickly tell you when an element is present on a webpage built to be used with a cronfile to quickly inform you when things change}
  spec.summary       = %q{let's you know when things change on the internet}
  spec.homepage      = "https://github.com/mhauserr/tell_me_when"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "docopt", "~> 0.5.0"
  spec.add_runtime_dependency "green_shoes", "~> 1.1.374"
  spec.add_runtime_dependency 'nokogiri', "~> 1.6.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
