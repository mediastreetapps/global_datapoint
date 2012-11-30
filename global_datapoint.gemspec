# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'global_datapoint/version'

Gem::Specification.new do |gem|
  gem.name          = "global_datapoint"
  gem.version       = GlobalDatapoint::VERSION
  gem.authors       = ["Richard Patching"]
  gem.email         = ["richard@justaddpixels.com"]
  gem.description   = %q{Ruby lib that wraps the global datapoint api}
  gem.summary       = %q{Ruby lib that wraps the global datapoint api}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'

  gem.add_dependency 'httparty', '= 0.4.3'
  gem.add_dependency 'nokogiri', '= 1.5.2'
end
