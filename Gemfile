source 'https://rubygems.org'

ruby File.read('.ruby-version').strip

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'hamlit'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'rake'
gem 'sassc-rails'
gem 'webpacker'

group :development, :test do
  gem 'awesome_print'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'rails_best_practices'
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'email_spec'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
