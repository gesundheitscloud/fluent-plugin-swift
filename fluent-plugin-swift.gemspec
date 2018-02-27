# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-swift"
  gem.description = "OpenStack Storage Service (Swift) output plugin for Fluentd event collector"
  gem.homepage    = "https://github.com/yuuzi41/fluent-plugin-swift"
  gem.summary     = gem.description
  gem.version     = File.read("VERSION").strip
  gem.license     = "Apache-2.0"
  gem.authors     = ["yuuzi41"]
  gem.email       = ""
  gem.has_rdoc    = false
  #gem.platform    = Gem::Platform::RUBY
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency "fluentd", "~> 0.12.0"
  gem.add_dependency "fog", "~> 1.15.0"
  gem.add_dependency "yajl-ruby", "~> 1.0"
  gem.add_dependency "fluent-mixin-config-placeholders", "~> 0.2.0"
  gem.add_development_dependency "rake", ">= 0.9.2"
  gem.add_development_dependency "flexmock", ">= 1.2.0"
end
