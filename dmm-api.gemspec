# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dmm/api/version'

Gem::Specification.new do |spec|
  spec.name          = "dmm-api"
  spec.version       = Dmm::Api::VERSION
  spec.authors       = ["shoprev"]
  spec.email         = ["admin@shoprev.net"]
  spec.description   = %q{Ruby DMM Web Service API ver 2.0}
  spec.summary       = %q{Ruby DMM Web Service API ver 2.0}
  spec.homepage      = "https://github.com/shoprev/dmm-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock", "1.11.0"
  # spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "activesupport", "4.1.4"
end
