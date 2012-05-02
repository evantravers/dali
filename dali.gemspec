# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dali/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Evan Travers"]
  gem.email         = ["evantravers@gmail.com"]
  gem.description   = %q{A gem for generating emails/small websites from mustache templates}
  gem.summary       = %q{Gem designed to streamline the creation of custom emails for deploying to mailchimp, campaign monitor and similar sites}
  gem.homepage      = "http://twitter.com/evantravers"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dali"
  gem.require_paths = ["lib"]
  gem.add_dependency 'mustache', '~> 0.99.4'
  gem.version       = Dali::VERSION
end
