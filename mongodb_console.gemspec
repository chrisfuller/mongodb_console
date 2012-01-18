$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongodb_console/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongodb_console"
  s.version     = MongodbConsole::VERSION
  s.authors     = ["Chris Fuller"]
  s.email       = ["git@chrisfuller.me"]
  s.homepage    = "http://github.com/chrisfuller/mongodb_console"
  s.summary     = "A Rake task for opening a MongoDB console for the current Rails.env"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency "mongo"
end
