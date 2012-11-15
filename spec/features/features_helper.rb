require 'spec_helper'
require 'capybara/rspec'

# Put feature spec helpers inside /spec/features/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before :each do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      DatabaseCleaner.strategy = :truncation
    end
    DatabaseCleaner.start
  end

  config.after :each do
    reset_mailer
    Delorean.back_to_the_present
    DatabaseCleaner.clean
  end
end
