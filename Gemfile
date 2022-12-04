source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem 'bcrypt', '~> 3.1.7'

gem 'jquery-rails', '~> 4.3', '>= 4.3.3'

gem 'rails-ujs', '~> 0.1.0'

gem 'geocoder', '>= 1.8.0'

gem 'validates_timeliness', '~> 7.0.0.beta1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem 'coveralls', require: false
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem "jasmine"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'solargraph'
  gem 'rubocop'
  gem 'rubocop-rails', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

gem "sass-rails"

gem 'coveralls_reborn', '~> 0.25.0', require: false

gem "simplecov"

gem 'simplecov-lcov', '~> 0.8.0'

gem "coveralls", require: false

gem 'leaflet-rails'