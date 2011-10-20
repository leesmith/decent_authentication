require 'integration/integration_helper'

describe 'User registration' do

  it 'is required before authentication' do
    visit root_path
    page.should have_content('Please sign in')
    page.should_not have_content('Welcome')
  end

  it 'does not allow empty submissions' do
    visit register_path
    click_button 'Register'
    page.should have_content("Email can't be blank")
    page.should have_content("Password can't be blank")
  end

  it 'displays confirmation errors' do
    visit register_path
    fill_in 'Email', with: 'jack@mail.com'
    fill_in 'Password', with: 'welcome'
    fill_in 'Password confirmation', with: 'nomatch'
    click_button 'Register'
    page.should have_content("Password doesn't match confirmation")
  end

  it 'is successful' do
    visit register_path
    fill_in 'Email', with: 'jack@mail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Register'
    page.should have_content('Registration was successful')
  end

end
