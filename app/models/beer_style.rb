class BeerStyle < ActiveRecord::Base
  has_many :beers,
           inverse_of: :beer_style
  has_many :breweries,
           through:    :beers,
           inverse_of: :beer_styles
end
