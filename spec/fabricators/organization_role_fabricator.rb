Fabricator(:organization_role) do
  name { Faker::Lorem.word }
end

Fabricator(:organization_role_owner, from: :organization_role) do
  name 'owner'
end
