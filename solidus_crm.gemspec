# encoding: UTF-8
$:.push File.expand_path('./lib', File.dirname(__FILE__))
require 'solidus_crm/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_crm'
  s.version     = SolidusCrm::VERSION
  s.summary     = 'Add CRM events to the checkout'
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.author    = 'Seb Ashton'
  s.email     = 'seb@madetech.com'
  s.homepage  = 'https://www.madetech.com'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'solidus_core', '2.3.0'
  s.add_dependency 'httparty', '~> 0.13.7'

  s.add_development_dependency 'byebug', '8.2.1'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'pry-byebug', '3.3.0'
  s.add_development_dependency 'pry-rails', '0.3.4'
  s.add_development_dependency 'rspec-activemodel-mocks', '~>1.0.2'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop', '0.38.0'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'spring-commands-rspec', '1.0.4'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'vcr', '3.0.1'
  s.add_development_dependency 'webmock', '1.22.6'
end
