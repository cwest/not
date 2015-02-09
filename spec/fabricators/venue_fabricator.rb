Fabricator(:venue) do
  name         { Faker::Company.name }
  address      { %w(street_address city state_abbr postcode).map { |message| Faker::Address.send(message) }.join(', ') }
  organization
end
