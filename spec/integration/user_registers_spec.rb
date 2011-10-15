require 'integration/integration_helper'

describe 'User registers' do
  context 'empty submission' do
    visit register_path
    click_button 'Register'
    page.should have_content('Email is required')
    page.should have_content('Password is required')
  end

end
