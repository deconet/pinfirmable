$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pinfirmable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pinfirmable"
  s.version     = Pinfirmable::VERSION
  s.authors     = ["Greg Woodcock"]
  s.email       = ["greg@yoomee.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Pinfirmable."
  s.description = "TODO: Description of Pinfirmable."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
