# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your wagon's version:
require "hitobito_kljb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "hitobito_kljb"
  s.version = HitobitoKljb::VERSION
  s.authors = ["Matthias Viehweger"]
  s.email = ["viehweger@puzzle.ch"]
  # s.homepage    = 'TODO'
  s.summary = "KLJB"
  s.description = "Groupstructure for KLJB-wagon"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
end
