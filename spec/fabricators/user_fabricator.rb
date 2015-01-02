Fabricator(:user) do
  email do
    seq = Fabricate.sequence(:user_email)
    Faker::Internet.safe_email("#{seq}-test-user")
  end
  password { Faker::Internet.password }
end
