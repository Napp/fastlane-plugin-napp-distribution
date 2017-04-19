# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/napp_distribution/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-napp_distribution'
  spec.version       = Fastlane::NappDistribution::VERSION
  spec.author        = %q{Mads Møller}
  spec.email         = %q{mm@napp.dk}

  spec.summary       = %q{Upload IPA AND APK builds to Napp Distribution}
  spec.homepage      = "https://github.com/Napp/fastlane-plugin-napp-distribution"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.27.0'
end
