require 'email_spec'

RSpec.configure do |config|
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers

  config.after :each do
    reset_mailer
  end
end
