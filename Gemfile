source 'http://rubygems.org'

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'decent_exposure'
gem 'haml'
gem 'jquery-rails'
gem 'mysql2' if ENV['DB'] == 'mysql'
gem 'pg' if ENV['DB'].nil? || ENV['DB'] == 'postgres'
gem 'rails', '3.1.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'delorean'
  gem 'email_spec'
  gem 'fabrication'
  gem 'shoulda'
end

group :development do
  gem 'ruby-debug19', require: 'ruby-debug'
end

group :development, :test do
  gem 'rspec-rails'
end
