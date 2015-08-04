require 'rails_helper'

RSpec.describe 'User signs in' do

  it 'successfully' do
    sign_in Fabricate(:user)
    expect(page).to have_content('You have successfully authenticated')
    expect(current_path).to eq root_path
    visit sign_in_path
    expect(current_path).to eq root_path
  end

  it 'successfully with mixed-case email address' do
    user = Fabricate(:user, email: 'TeSt@EXample.com')
    visit sign_in_path
    fill_in 'Email', with: 'tEsT@exAMple.com'
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(current_path).to eq root_path
  end

  it 'successfully with redirect to root path' do
    sign_in Fabricate(:user)
    expect(current_path).to eq root_path
    visit sign_in_path
    expect(current_path).to eq root_path
  end

  it 'successfully with redirect to an intended url' do
    user = Fabricate(:user)
    visit user_path(user)
    expect(current_path).to eq sign_in_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(current_path).to eq user_path(user)
    click_button 'Sign out'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(current_path).to eq root_path
  end

  context 'when invalid attempt displays errors for' do
    before { Fabricate(:user, email: 'jack@mail.com', password: 'welcome', password_confirmation: 'welcome') }

    it 'empty form submission' do
      visit sign_in_path
      click_button 'Sign in'
      expect(page).to have_content('Invalid sign in attempt')
    end

    it 'incorrect password' do
      visit sign_in_path
      fill_in 'Email', with: 'jack@mail.com'
      fill_in 'Password', with: 'nogood'
      click_button 'Sign in'
      expect(page).to have_content('Invalid sign in attempt')
    end

    it 'incorrect email' do
      visit sign_in_path
      fill_in 'Email', with: 'bob@mail.com'
      fill_in 'Password', with: 'welcome'
      click_button 'Sign in'
      expect(page).to have_content('Invalid sign in attempt')
    end
  end

end
