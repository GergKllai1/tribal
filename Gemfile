source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.5'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'react_on_rails', '11.1.4'
gem 'devise'
gem 'tailwindcss', '~> 0.2.0'
gem 'omniauth-facebook'
gem 'stripe-rails'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'factory_bot_rails'


group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
	gem 'coveralls', require: false
	gem "selenium-webdriver"
	gem "chromedriver-helper"
	gem "timecop"
  gem 'launchy', '~> 2.4', '>= 2.4.3'
	gem 'stripe-ruby-mock', '~> 2.5.4', require: 'stripe_mock'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rb-readline', '~> 0.5.3'
end

gem 'mini_racer', platforms: :ruby
