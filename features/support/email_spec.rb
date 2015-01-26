require 'email_spec'
require 'email_spec/cucumber'

EmailSpec::AddressConverter.instance.conversion do |input|
  if input.is_a?(User)
    input.email
  else
    input
  end
end
