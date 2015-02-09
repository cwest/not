class Brewery < ActiveRecord::Base
  has_many :beers,
           inverse_of: :brewery
  has_many :beer_styles,
           through:    :beers,
           inverse_of: :brewries
end
