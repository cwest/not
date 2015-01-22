Then(/^I should see a (\w+) message$/) do |type|
  flash_message(type)
end
