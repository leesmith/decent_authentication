require 'rails_helper'

RSpec.describe 'User session is remembered' do

  it 'with option not to remember' do
    sign_in Fabricate(:user)
    expect(current_path).to eq root_path
    delete_session_cookie
    visit root_path
    expect(current_path).to eq sign_in_path
  end

  it 'successfully' do
    sign_in_with_cookie Fabricate(:user)
    expect(current_path).to eq root_path
    delete_session_cookie
    visit root_path
    expect(current_path).to eq root_path
  end

end
