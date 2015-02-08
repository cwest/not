Fabricator(:beer) do
  name       { [Faker::Hacker.adjective, Faker::Hacker.noun].map(&:camelize).join(' ') }
  abv        { (rand(100).to_f / 20) + 5 }
  brewery
  beer_style
end
