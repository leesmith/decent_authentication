RSpec::Matchers.define :have_form_field_error_for do |expected|
  match do |actual|
    expect(page).to have_xpath("//div[@class='field_with_errors']/input[@id='#{expected}']")
  end

  # optional
  failure_message do |actual|
    "expected form field_with_errors for #{expected}"
  end

  # optional
  failure_message_when_negated do |actual|
    "expected no form field_with_errors for #{expected}"
  end
end
