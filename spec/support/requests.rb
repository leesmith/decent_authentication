require 'rails_helper'

def sign_in(user)
  visit signin_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign In'
end

def sign_in_with_cookie(user)
  visit signin_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  check 'Remember me'
  click_button 'Sign in'
end

def delete_session_cookie
  rack_test_driver = Capybara.current_session.driver
  cookie_jar = rack_test_driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  cookie_jar.instance_variable_get(:@cookies).reject! do |existing_cookie|
    existing_cookie.expires.nil?
  end
end
