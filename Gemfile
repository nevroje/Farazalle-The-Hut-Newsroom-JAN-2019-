source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'webpacker', '~> 3.5'
gem 'tailwindcss', '~> 0.2.0'
gem 'devise'
gem 'haml'
gem 'stripe-rails'
gem 'geocoder'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
	gem 'email_spec'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
	gem 'chromedriver-helper'
	gem 'selenium-webdriver'
  gem 'coveralls', require: false
  gem 'launchy'
	gem 'stripe-ruby-mock', '~> 2.5.6', require: 'stripe_mock'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
