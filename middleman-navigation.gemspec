# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-navigation/version"

Gem::Specification.new do |s|
  s.name        = "middleman-navigation"
  s.version     = Middleman::Navigation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Giovanni Cangiani", "Michael Hellein"]
  s.email       = ["giovanni.cangiani@epfl.ch", "m@hellm.com"]
  s.homepage    = "https://github.com/multiscan/middleman-navigation"
  s.summary     = %q{Add simple navigation helpers for your Middleman project}
  s.description = %q{Add simple navigation helpers for your Middleman project}

  s.rubyforge_project = "middleman-navigation"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("middleman-core", ["~> 3.2"])
  s.add_dependency("simple-navigation", ["~> 3.0"])

  s.add_development_dependency "activesupport", ["~> 3.2"]
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "bundler"
  s.add_development_dependency "gem-release" # Seems a better fit than Jeweler.
end
