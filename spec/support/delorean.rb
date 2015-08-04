RSpec.configure do |config|
  config.include Delorean

  config.after :each do
    Delorean.back_to_the_present
  end
end
