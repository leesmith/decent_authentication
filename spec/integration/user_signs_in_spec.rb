require 'integration/integration_helper'

describe 'User signs in' do

  it 'successfully' do
    sign_in Fabricate(:user)
    page.should have_content('You have successfully authenticated')
    current_path.should == root_path
  end

  context 'when invalid attempt displays errors for' do
    before { Fabricate(:user, email: 'jack@mail.com', password: 'welcome', password_confirmation: 'welcome') }

    it 'empty form submission' do
      visit sign_in_path
      click_button 'Sign in'
      page.should have_content('Invalid sign in attempt')
    end

    it 'incorrect password' do
      visit sign_in_path
      fill_in 'Email', with: 'jack@mail.com'
      fill_in 'Password', with: 'nogood'
      click_button 'Sign in'
      page.should have_content('Invalid sign in attempt')
    end

    it 'incorrect email' do
      visit sign_in_path
      fill_in 'Email', with: 'bob@mail.com'
      fill_in 'Password', with: 'welcome'
      click_button 'Sign in'
      page.should have_content('Invalid sign in attempt')
    end
  end

end
