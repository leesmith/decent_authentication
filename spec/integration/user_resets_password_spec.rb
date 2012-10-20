require 'integration/integration_helper'

describe 'User resets password' do

  before :each do
    Fabricate(:user, email: 'sam.adams@mail.com')
    visit new_password_reset_path
  end

  it 'unsuccessfully with empty form submission' do
    click_button 'Reset Password'
    current_path.should == new_password_reset_path
    page.should have_content('You must provide an email')
  end

  it 'for nonexistent email should have same UX' do
    fill_in 'Email', with: 'bob.jones@mail.com'
    click_button 'Reset Password'
    current_path.should == sign_in_path
    page.should have_content('An email was just sent to you')
    unread_emails_for('bob.jones@mail.com').size.should == 0
  end

  it 'successfully' do
    fill_in 'Email', with: 'sam.adams@mail.com'
    click_button 'Reset Password'
    current_path.should == sign_in_path
    page.should have_content('An email was just sent to you')
    unread_emails_for('sam.adams@mail.com').size.should == 1
    open_email('sam.adams@mail.com')
    click_first_link_in_email
    page.should have_content('Change Password')
    click_button 'Change Password'
    page.should have_content("Password can't be blank")
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    click_button 'Change Password'
    current_path.should == sign_in_path
    page.should have_content('Your password was successfully changed')
  end

  it 'unsuccessfully with expired password token' do
    fill_in 'Email', with: 'sam.adams@mail.com'
    click_button 'Reset Password'
    current_path.should == sign_in_path
    page.should have_content('An email was just sent to you')
    unread_emails_for('sam.adams@mail.com').size.should == 1
    let_password_token_expire
    open_email('sam.adams@mail.com')
    click_first_link_in_email
    page.should have_content('Change Password')
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    click_button 'Change Password'
    current_path.should == new_password_reset_path
    page.should have_content('Password reset has expired')
  end

end
