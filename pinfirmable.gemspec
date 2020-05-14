
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pinfirmable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pinfirmable"
  s.version     = Pinfirmable::VERSION
  s.authors     = ["Greg Woodcock"]
  s.email       = ["greg@yoomee.com"]
  s.homepage    = "https://github.com/Yoomee/pinfirmable"
  s.summary     = "Drop in replacement for devise confirmable"
  s.description = "Replace devise confirmable with a pin emailed to users which they enter after signup"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 5.0.6", "< 5.3"
  s.add_dependency "devise", "~> 4.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~>3.7"
  s.add_development_dependency "capybara", "~>2.16.1"
  s.add_development_dependency "timecop"
end
