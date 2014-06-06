# TellMeWhen

# tell_me_when

code  :: https://github.com/mhauserr/tell_me_when

## DESCRIPTION

This is a small simple application that displays a popup if a css or xpath
selector is present on a page (and possibly if the text inside that selector
matches something). I built it so that you can put it into your cron file
if a site is in maintenance mode or to check on a status page so that you can
tell when the status is good or bad.
My usage is to add this to a crontab file with `crontab -e` then follow the advice in [Usage](#usage), example:

```
* * * * * export DISPLAY=:0 && tell_me_when -x -d https://status.github.com/ '//*[@id="message" and @class="good"]'
```
this example checks the github status page every minute and will pop up a notice if the services are down (because there will not be an element that has id message and class good)

## FEATURES/PROBLEMS:

* FIX (list of features or problems)

## Usage

From the docstring:

```
Usage:
  lib/tell_me_when.rb [--css | --xpath] [--appears | --disappears] [--matches=<regex>] <site> <path_to_element>
  lib/tell_me_when.rb -h | --help
  lib/tell_me_when.rb --version

Options:
  -h --help                      Show this screen.
  --version                      Show version.
  -c --css                       Search by css
  -x --xpath                     Search by xpath
  -a --appears                   Display when value appears
  -d --disappears                Display when value disappears
  -m=<regex> --matches=<regex>   Display only if the element matches the regex
```

Example usage:

```
tell_me_when.rb -x -d https://status.github.com/ '//*[@id="message" and @class="good"]'
tell_me_when.rb -c -a --matches="10.*" https://status.github.com/ "#graphs > div:nth-child(2) > div.data > span"
```

## INSTALL:

```
gem install tell_me_when
```

## DEVELOPERS:

```
bundle
rake test
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## LICENSE:

(The MIT License)

Copyright (c) 2014 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
