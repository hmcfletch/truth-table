# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "truth-table"

Gem::Specification.new do |s|
  s.name        = "truth-table"
  s.version     = TruthTable::VERSION
  s.authors     = ["Les Fletcher"]
  s.email       = ["les.fletcher@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{The gem of truth}
  s.description = %q{Generate a truth table for a logical expression}

  s.rubyforge_project = "truth-table"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('test-unit', '~> 2.2.0')
end
