When /^I let my password token expire$/ do
  Delorean.time_travel_to 2.hours.from_now
end
