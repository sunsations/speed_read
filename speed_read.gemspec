# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speed_read/version'

Gem::Specification.new do |spec|
  spec.name          = "speed_read"
  spec.version       = SpeedRead::VERSION
  spec.authors       = ["Thomas Arni"]
  spec.email         = ["thomas.arni@gmail.com"]
  spec.summary       = %q{A simple terminal-based open source spritz-alike.}
  spec.description   = %q{A simple terminal-based open source spritz-alike. Allows you to read at a much more rapid pace.}
  #TODO set correct homepage
  spec.homepage      = "https://github.com/sunsations/speed_read"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_dependency 'colorize', '~> 0.6'
end
