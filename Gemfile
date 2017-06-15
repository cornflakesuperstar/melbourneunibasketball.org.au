source 'https://rubygems.org'

gem 'rails', '3.2.11'
ruby '2.1.7'

gem 'activemerchant'
gem 'carrierwave'
gem 'carrierwave_backgrounder'
gem 'cloudinary'
gem 'delayed_job_active_record'
gem 'daemons'
gem "friendly_id", "~> 4.0.9"
gem 'haml-rails'
gem 'jquery-rails'
gem 'mini_magick'
gem 'nokogiri'
gem 'pg'
gem 'tinymce-rails', '~> 3.5.8'
gem 'tinymce-rails-imageupload', '~> 3.5.6.3'
gem 'unicorn'
gem "workless", "~> 1.1.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
group :production do
  gem 'newrelic_rpm'
end

group :test do
  gem "capybara", ">= 1.0.0"
  gem "database_cleaner", "0.5.2"
  gem "email_spec"
  gem "faker", ">= 0.3.1"
  gem "fakeweb", ">= 1.3.0"
  gem "launchy", ">= 0.4.0"
  gem 'machinist', '>= 2.0.0.beta2'
  gem "timecop", "~> 0.3.5"
end

group :test, :development do
  gem "rspec-rails", ">= 2.5"
  gem 'byebug'
end

group :development do
  gem "syntax"
end
