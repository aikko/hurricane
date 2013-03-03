Gem::Specification.new do |s|
  s.name = %q{hurricane}
  s.version = "0.0.1"
  s.author = "Justice Jiang"
  s.email = "jgnan1981@163.com"
  s.summary = %q{Manager site manager build up helper}
  s.description = %q{This gem is for building yy manager site with rails, it provides sass, haml, cancan , and other home built features and assets for developer to build up the business manager site faster and easier}

  s.files = Dir["{lib,spec}/**/*", "[A-Z]*"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'rails', '~> 3.0.9'
  s.add_development_dependency 'railties','~> 3.1'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
