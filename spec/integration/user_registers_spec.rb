require 'integration/integration_helper'

describe 'User registration' do
  it 'does not allow empty submissions' do
    visit register_path
    click_button 'Register'
    page.should have_content('Email is required')
    page.should have_content('Password is required')
  end
end
