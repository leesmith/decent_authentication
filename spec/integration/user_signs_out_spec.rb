require 'integration/integration_helper'

describe 'User signs out' do

  it 'successfully' do
    sign_in Fabricate(:user)
    click_button 'Sign out'
    current_path.should == sign_in_path
  end

end
