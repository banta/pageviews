# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pageviews/version'

Gem::Specification.new do |spec|
  spec.name          = "pageviews"
  spec.version       = Pageviews::VERSION
  spec.authors       = ['Bernard Banta']
  spec.email         = ['banta.bernard@gmail.com']

  spec.summary       = 'Easy way to log Rails page views'
  spec.description   = 'Pageviews is a page views counting gem for Rails. Log views from Rails controller actions.'
  spec.homepage      = 'http://bbanta.com'
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 3.0'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
    spec.metadata['homepage_uri']      = spec.homepage
    spec.metadata['source_code_uri']   = 'https://github.com/StrongMind/pageviews'
    spec.metadata['changelog_uri']     = 'https://github.com/StrongMind/pageviews/CHANGELOG.md'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir.glob("{lib,exe,bin}/**/*") + %w[README.md LICENSE]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.5"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.60"
  spec.add_development_dependency "simplecov", "~> 0.22"
  spec.add_development_dependency "activerecord", "~> 8.0"
  #  spec.add_development_dependency "sqlite3", "~> 1.4"

end