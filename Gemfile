source 'http://rubygems.org'

ruby '2.2.2'

gem 'bcrypt-ruby', '~> 3.0.1'
gem 'haml'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '~> 3.2.21'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'delorean'
  gem 'email_spec'
  gem 'launchy'
  gem 'rake'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'test-unit'
end

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'fabrication'
  gem 'pry-rails'
  gem 'rspec-rails'
end
