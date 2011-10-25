require 'integration/integration_helper'

describe 'User session is remembered' do

  it 'with option not to remember' do
    sign_in Fabricate(:user)
    current_path.should == root_path
    delete_session_cookie
    visit root_path
    current_path.should == sign_in_path
  end

  it 'successfully' do
    sign_in_with_cookie Fabricate(:user)
    current_path.should == root_path
    delete_session_cookie
    visit root_path
    current_path.should == root_path
  end
end
