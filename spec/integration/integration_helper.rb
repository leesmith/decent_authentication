require 'spec_helper'
require 'capybara/rspec'

# Put integration spec helpers inside /spec/integration/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # capybara helpers are only enabled for groups with type of request
  config.include Rails.application.routes.url_helpers, :type => :request

  config.use_transactional_fixtures = false

  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end
end
