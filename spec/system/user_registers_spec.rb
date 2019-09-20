require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

  it 'is required before authentication' do
    visit root_path
    expect(page).to have_content('You must sign in to continue')
    expect(page).to have_current_path signin_path
  end

  it 'does not allow empty submissions' do
    visit register_path
    click_button 'Save'
    expect(page).to have_content('Please correct the errors')
    expect(page).to have_form_field_error_for('user_name')
    expect(page).to have_form_field_error_for('user_email')
    expect(page).to have_form_field_error_for('user_password')
  end

  it 'is successful' do
    visit register_path
    fill_in 'user_name', with: 'Jim Beam'
    fill_in 'user_email', with: 'jim@example.com'
    fill_in 'user_password', with: 'LK234lwe'
    fill_in 'user_password_confirmation', with: 'LK234lwe'
    click_button 'Save'
    expect(page).to have_content('Thanks for signing up')
    expect(page).to have_current_path signin_path
  end

end
