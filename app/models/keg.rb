class Keg < ActiveRecord::Base
  has_one :venue_tap,
          inverse_of: :keg

  belongs_to :venue,
             inverse_of: :kegs
  belongs_to :beer,
             inverse_of: :kegs
  belongs_to :keg_volume,
             inverse_of: :kegs
end
