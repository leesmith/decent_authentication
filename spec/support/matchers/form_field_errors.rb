RSpec::Matchers.define :have_form_field_error_for do |expected|
  match do
    expect(page).to have_xpath("//div[@class='field_with_errors']/input[@id='#{expected}']")
  end

  # optional
  failure_message do
    "expected form field_with_errors for #{expected}"
  end

  # optional
  failure_message_when_negated do
    "expected no form field_with_errors for #{expected}"
  end
end
