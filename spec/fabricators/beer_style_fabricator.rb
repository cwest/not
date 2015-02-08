Fabricator(:beer_style) do
  name { Faker::Lorem.words(2).map(&:camelize).join(' ') }
end
