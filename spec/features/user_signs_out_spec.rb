require 'rails_helper'

RSpec.describe 'User signs out' do

  it 'successfully' do
    sign_in Fabricate(:user)
    click_button 'Sign out'
    expect(current_path).to eq sign_in_path
  end

end
