require 'rails_helper'

RSpec.describe 'User resets password' do

  before :each do
    Fabricate(:user, email: 'sam.adams@mail.com')
    visit new_password_reset_path
  end

  it 'unsuccessfully with empty form submission' do
    click_button 'Reset Password'
    expect(current_path).to eq new_password_reset_path
    expect(page).to have_content('You must provide an email')
  end

  it 'for nonexistent email should have same UX' do
    fill_in 'email', with: 'bob.jones@mail.com'
    click_button 'Reset Password'
    expect(current_path).to eq sign_in_path
    expect(page).to have_content('An email was just sent to you')
    expect(unread_emails_for('bob.jones@mail.com').size).to eq 0
  end

  it 'successfully' do
    fill_in 'email', with: 'sam.adams@mail.com'
    click_button 'Reset Password'
    expect(current_path).to eq sign_in_path
    expect(page).to have_content('An email was just sent to you')
    expect(unread_emails_for('sam.adams@mail.com').size).to eq 1
    open_email('sam.adams@mail.com')
    click_first_link_in_email
    expect(page).to have_content('Change Password')
    click_button 'Change Password'
    expect(page).to have_content("Password can't be blank")
    fill_in 'user_password', with: 'newpassword'
    fill_in 'user_password_confirmation', with: 'newpassword'
    click_button 'Change Password'
    expect(current_path).to eq sign_in_path
    expect(page).to have_content('Your password was successfully changed')
  end

  it 'unsuccessfully with expired password token' do
    fill_in 'email', with: 'sam.adams@mail.com'
    click_button 'Reset Password'
    expect(current_path).to eq sign_in_path
    expect(page).to have_content('An email was just sent to you')
    expect(unread_emails_for('sam.adams@mail.com').size).to eq 1
    let_password_token_expire
    open_email('sam.adams@mail.com')
    click_first_link_in_email
    expect(page).to have_content('Change Password')
    fill_in 'user_password', with: 'newpassword'
    fill_in 'user_password_confirmation', with: 'newpassword'
    click_button 'Change Password'
    expect(current_path).to eq new_password_reset_path
    expect(page).to have_content('Password reset has expired')
  end

end
