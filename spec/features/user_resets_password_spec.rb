require 'rails_helper'

RSpec.describe 'User resets password' do

  include ActiveSupport::Testing::TimeHelpers

  let!(:user) { create(:user, email: 'sam.jones@example.com') }

  describe 'with valid reset token' do
    before do
      visit new_password_reset_path
      fill_in 'email', with: 'Sam.Jones@example.com'
      click_on 'Send Instructions'
      expect(unread_emails_for(user.email).size).to eq 1
      open_email(user.email)
      click_first_link_in_email
      expect(page).to have_content('Change Password')
    end

    it 'successfully' do
      fill_in 'user_password', with: 'newpassw0rd'
      fill_in 'user_password_confirmation', with: 'newpassw0rd'
      click_button 'Save'
      user.reload
      expect(user.password_reset_sent_at).to eq nil
      expect(user.password_reset_token).to eq nil
      expect(page).to have_content('Your password was successfully changed')
    end

    it 'unsuccessfully with empty fields' do
      click_button 'Save'
      expect(page).to have_content("Password can't be blank")
    end

    it 'unsuccessfully with bad password' do
      fill_in 'user_password', with: 'newpassw0rd'
      fill_in 'user_password_confirmation', with: 'blahblahblah'
      click_button 'Save'
      expect(page).to have_content("doesn't match")
    end
  end

  describe 'with invalid reset token' do
    before do
      visit new_password_reset_path
      fill_in 'email', with: user.email
      click_on 'Send Instructions'
    end

    it 'unsuccessfully with unknown reset token' do
      visit edit_password_reset_path(id: 'abcd')
      expect(page).to have_content 'Invalid request'
      expect(current_path).to eq new_password_reset_path
    end

    it 'unsuccessfully with expired password token' do
      travel_to 2.01.hours.from_now do
        expect(unread_emails_for(user.email).size).to eq 1
        open_email(user.email)
        click_first_link_in_email
        expect(page).to have_content('Change Password')
        fill_in 'user_password', with: 'newpassword'
        fill_in 'user_password_confirmation', with: 'newpassword'
        click_button 'Save'
        expect(current_path).to eq new_password_reset_path
        expect(page).to have_content('This password reset request has expired')
      end
    end
  end

end
