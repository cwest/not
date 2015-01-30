Given(/^I have (\w+) organizations?$/) do |count|
  steps %(
    Given I'm logged in
    Given there are #{count} organizations
  )
end

Given(/^there are (\w+) organizations?$/) do |count|
  clear_organizations
  step "I create #{count} organizations"
end

When(/^I view my organizations$/) do
  visit organizations_path
end

When(/^I create (\w+) organizations?$/) do |count|
  @organizations = []
  count = string_to_number(count)
  count.times { @organizations.push(create_organization) }
end

When(/^I view my first organization$/) do
  visit organization_path(find_organization(@organizations.first))
end

Then(/^I should see (\w+) organizations?$/) do |count|
  count = string_to_number(count)
  expect(all('.organizations .organization').length).to eq(count)
end

Then(/^I should see my organization's name$/) do
  expect(page).to have_selector('.name', text: find_organization(@organizations.first).name)
end
