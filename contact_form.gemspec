# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "contact_form"
  s.summary = "The contact form from aRailsDemo.com"
  s.description = "See Post #43"
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_runtime_dependency("rails", ["~> 3.0.0"])
  s.add_runtime_dependency("mail_form", [">= 1.3.0"])
  s.add_runtime_dependency("simple_form", [">= 1.3.0"])
  s.add_runtime_dependency("haml-rails", [">= 0.3.4"])

  s.add_development_dependency("rspec-rails", ["~> 2.4.1"])
  s.add_development_dependency("capybara", [">= 0.4.0"])
  s.add_development_dependency("launchy", [">= 0.3.7"])
end
