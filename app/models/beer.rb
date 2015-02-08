class Beer < ActiveRecord::Base
  belongs_to :brewery,
             inverse_of: :beers
  belongs_to :beer_style,
             inverse_of: :beers
end
