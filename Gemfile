source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.9'
gem 'pg'

gem 'unicorn'
gem 'unicorn-worker-killer'
gem 'newrelic_rpm'

gem 'gibbon'
gem 'rest-client'

##### geo
gem 'geokit-rails'
gem 'going_postal'


##### assets
# Use SCSS for stylesheets
  gem 'sass-rails', '~> 4.0.2'
# Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  gem "fog", "~>1.20", require: "fog/aws/storage"
  gem 'asset_sync'
# Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails', '~> 4.0.0'
  gem 'foundation-rails'
  gem 'haml'
  gem "haml-rails"
  gem 'foundation-icons-sass-rails'
# Use jquery as the JavaScript library
  gem 'jquery-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

##### profiles
  gem 'devise', '~> 3.2.4'
  gem 'omniauth-facebook'
  gem 'rails_admin'
  gem 'cancan'
  gem 'paper_trail', '~> 3.0.6'
  gem "nilify_blanks"


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# gem 'aws-sdk'
# gem 'pusher'
# gem 'will_paginate', '~> 3.0.5'
# gem "paperclip", "~> 4.1"

# gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
# gem 'acts-as-taggable-on'
# gem 'rest_client'

group :staging, :production do
  gem "rails_12factor"
end

group :development do
	gem 'better_errors' 
	gem 'quiet_assets' 
	gem 'rails_layout'
  gem 'foreman'
end

group :development, :test do
  gem "vcr"
  gem "pry"
  gem 'awesome_print'
end

group :test do
  gem 'rspec'
  gem 'simplecov'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'capybara', "~> 2.2.0"
  gem 'capybara-email'
  gem 'cucumber-rails',:require => false
  gem "factory_girl_rails", "~> 4.4.0"
  gem 'selenium-webdriver', "~> 2.41.0"
  #gem "poltergeist"
  gem 'database_cleaner',:require => false
  gem "pry-nav"
  gem "webmock"
  gem "email_spec"
  gem "timecop"
  gem 'cucumber-timecop', :require => false
end

group :blog do
  gem 'sinatra', '~> 1.4.2'
end