require 'rails_helper'

RSpec.describe 'User signs out' do

  it 'successfully' do
    sign_in create(:user)
    find('#nav-signout').click
    expect(page).to have_content 'You have successfully signed out'
    expect(current_path).to eq signin_path
    visit root_path
    expect(current_path).to eq signin_path
    expect(page).to have_content 'You must sign in to continue'
  end

end
