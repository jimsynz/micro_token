# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'micro_token/version'

Gem::Specification.new do |spec|
  spec.name          = "micro_token"
  spec.version       = MicroToken::VERSION
  spec.authors       = ["James Harton"]
  spec.email         = ["jamesotron@gmail.com"]
  spec.description   = %q{A tiny random token generator}
  spec.summary       = %q{A tiny random token generator}
  spec.homepage      = "https://github.com/oshpark/micro_token"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  %w[rake rspec].each do |dep|
    spec.add_development_dependency dep
  end
end
