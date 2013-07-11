source 'https://rubygems.org'

# Framework
 gem 'rails', '3.2.13'

# JQuery
gem 'jquery-rails'

# SCSS handling for CSS files
gem 'sass-rails'

# JS and CSS minifier.
gem 'uglifier'

# Language listings
gem 'localized_language_select', :git => 'git://github.com/stepahn/localized_language_select.git'


group :development, :test do
  # DB
  gem 'sqlite3'

  # Debugger for 1.9.x
  gem 'debugger'
  gem 'binding_of_caller'

  # Model annotation
  gem 'annotate'

  # Better error views.
  gem "better_errors"

  # Analyzer for redundant activerecord queries.
  gem "bullet"
end


group :test do

  # Test framework
  gem 'rspec'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'capybara', '1.1.2'

  # For parallel testing on all cpu cores.
  gem "parallel_tests"

  # Factory for creating testing object
  gem 'factory_girl_rails'

  # Generates code coverage statistics.
  gem 'simplecov', :require => false

  # Vacuum cleaner for the test database.
  gem 'database_cleaner'
end

