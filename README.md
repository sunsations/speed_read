# SpeedRead

A simple terminal-based open source Spritz-alike.

This is a yet simplistic implementation in ruby of [Pasky's Perl version](https://github.com/pasky/speedread).

## Installation

Add this line to your application's Gemfile:

    gem 'speed_read'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install speed_read

## Usage
speed_read reads from standard input. Thus, 
you can use the usual unix suspects.

    $ echo "one two tree" | speed_read
    $ speed_read < your_text_file.txt
    $ cat your_text_file.txt | speed_read

To set the words per minute use

    $ echo "one two tree" | speed_read -w 500

## Test
In order to test the gem locally, use:
    
    bundle exec rake test

## Contributing

1. Fork it ( http://github.com/sunsations/speed_read/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
