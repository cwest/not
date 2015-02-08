class Beer < ActiveRecord::Base
  has_many :kegs,
           inverse_of: :beer

  belongs_to :brewery,
             inverse_of: :beers
  belongs_to :beer_style,
             inverse_of: :beers
end
