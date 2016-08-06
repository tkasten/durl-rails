# -*- encoding: utf-8 -*-
require File.expand_path('../lib/durl/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "durl-rails"
  s.version     = Durl::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tyler Kasten"]
  s.email       = ["tyler.kasten@gmail.com"]
  s.homepage    = "https://github.com/tkasten/durl-rails"
  s.summary     = "Use dURL with Rails 3+"
  s.description = "This gem provides dURL for your Rails 3+ application."
  s.license     = "MIT"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "durl-rails"

  s.add_dependency "railties", ">= 3.0", "< 5.0"
  s.add_dependency "thor",     ">= 0.14", "< 2.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_path = 'lib'
end
