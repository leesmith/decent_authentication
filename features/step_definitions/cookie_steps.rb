module CookieStepHelper
  def delete_cookie
    delete_rack_test_cookie(get_rack_test_cookie_jar)
  end

  def show_me_the_cookies
    cookie_jar = get_rack_test_cookie_jar
    puts cookie_jar.instance_variable_get(:@cookies).map(&:inspect).join("\n")
  end

  def get_rack_test_cookie_jar
    rack_test_driver = Capybara.current_session.driver
    cookie_jar = rack_test_driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  end

  def delete_rack_test_cookie(cookie_jar)
    cookie_jar.instance_variable_get(:@cookies).reject! do |existing_cookie|
      existing_cookie.expires.nil?
    end
  end
end
World(CookieStepHelper)

Given /^I close my browser$/ do
  delete_cookie
end
