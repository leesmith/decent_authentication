source 'http://rubygems.org'

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'decent_exposure'
gem 'haml'
gem 'jquery-rails'
gem 'rails'

gem 'mysql2' if ENV['DB'] == 'mysql'
gem 'pg' if ENV['DB'] == 'postgres'
gem 'sqlite3' if ENV['DB'].nil? || ENV['DB'] == 'sqlite'

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
  gem 'fabrication'
  gem 'rake'
  gem 'shoulda-matchers'
end

group :development do
  gem 'debugger'
end

group :development, :test do
  gem 'rspec-rails'
end
