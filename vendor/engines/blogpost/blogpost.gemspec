$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blogpost/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blogpost"
  s.version     = Blogpost::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Blogpost."
  s.description = "TODO: Description of Blogpost."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8.rc2"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "will_paginate"
end
