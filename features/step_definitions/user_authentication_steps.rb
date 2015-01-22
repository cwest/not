Given(/^I'm logged in$/) do
  step "I'm an existing user"
  login
end

Given(/^I'm locked out$/) do
  create_user
  become_locked_out
end

When(/^I join$/) do
  join
  find_user
end

When(/^I login$/) do
  create_user
  login
end

When(/^I logout$/) do
  logout
end

When(/^I reset my password$/) do
  reset_password
end

When(/^I get locked out$/) do
  become_locked_out
end

When(/^I request unlock instructions$/) do
  reset_mailer
  request_unlock_instructions
end

When(/^I request a password reset$/) do
  forgot_password
end

Then(/^I should be welcomed$/) do
  steps %(
    Then I should see a success message
     And "#{visitor[:email]}" should receive an email
    )
end

Then(/^I should reset my password$/) do
  steps %(
    Then I should receive an email
    When I open the email
     And I click the first link in the email
     And I reset my password
    Then I should see a success message
    )
end

Then(/^I should unlock myself$/) do
  steps %(
    Then I should receive an email
    When I open the email
     And I click the first link in the email
    Then I should see a success message
    )
end
