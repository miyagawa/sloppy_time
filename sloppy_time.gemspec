# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sloppy_time/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tatsuhiko Miyagawa"]
  gem.email         = ["miyagawa@bulknews.net"]
  gem.description   = %q{Sloppy use of Time in scopes}
  gem.summary       = %q{A silly gem to (possibly) detect a sloppy use of Times in scope arguments}
  gem.homepage      = "https://github.com/miyagawa/sloppy_time"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sloppy_time"
  gem.require_paths = ["lib"]
  gem.version       = SloppyTime::VERSION
end
