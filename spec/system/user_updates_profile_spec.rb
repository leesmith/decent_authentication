require 'rails_helper'

RSpec.describe 'User updates profile' do

  let!(:user) { create(:user) }

  before do
    sign_in user
    visit profile_path
  end

  it 'successfully' do
    fill_in 'user_name', with: 'Sam Adams III'
    fill_in 'user_email', with: 'SamAdamsIII@example.com'
    fill_in 'user_password', with: '1qaz2wsx3edc'
    fill_in 'user_password_confirmation', with: '1qaz2wsx3edc'
    click_button 'Save'
    user.reload
    expect(current_path).to eq profile_path
    expect(page).to have_text 'Your profile was successfully updated'
    expect(user.name).to eq 'Sam Adams III'
    expect(user.email).to eq 'samadamsiii@example.com'
  end

  it 'unsuccessfully' do
    fill_in 'user_email', with: ''
    click_button 'Save'
    user.reload
    expect(current_path).to eq profile_path
    expect(user.email).to_not be_nil
    expect(page).to have_form_field_error_for('user_email')
  end

  it 'unsuccessfully with password update' do
    fill_in 'user_password', with: 'password'
    click_button 'Save'
    user.reload
    expect(current_path).to eq profile_path
    expect(page).to have_text 'must be alphanumeric'
    expect(page).to have_form_field_error_for('user_password')
    expect(page).to have_text "doesn't match Password"
    expect(page).to have_form_field_error_for('user_password_confirmation')
  end

end
