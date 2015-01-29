Given(/^I'm a new user$/) do
  step "I'm an existing user"
end

Given(/^I'm an existing user/) do
  create_user
end

Given(/^I'm a visitor$/) do
  create_visitor
end
