# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'HTML/AutoTag/version'

Gem::Specification.new do |spec|
  spec.name          = "HTML-AutoTag"
  spec.version       = HTML::AutoTag::VERSION
  spec.authors       = ["jeffa"]
  spec.email         = ["jeffa@cpan.org"]
  spec.description   = %q{Just another HTML tag generator for ruby.}
  spec.summary       = %q{Generate HTML tags with ease (HTML4, HTML5, XHTML and SVG).}
  spec.homepage      = "https://github.com/jeffa/html-autotag-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "htmlentities"
end
