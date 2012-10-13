# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'post-it/version'

Gem::Specification.new do |gem|
  gem.name          = "post-it"
  gem.version       = PostIt::VERSION
  gem.authors       = ["Joe Workman"]
  gem.email         = ["joe at workmanmail.com"]
  gem.description   = %q{A simple utlity that uses `Sticky Notificiations.app` to post messages to Notification Center on Mac OS X.}
  gem.summary       = %q{A simple utlity that uses `Sticky Notificiations.app` to post messages to Notification Center on Mac OS X.}
  gem.homepage      = "https://github.com/joeworkman/post-it"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake','~> 0.9.2')
  gem.add_dependency('methadone', '~>1.2.1')
end
