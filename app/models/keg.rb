class Keg < ActiveRecord::Base
  belongs_to :venue,
             inverse_of: :kegs
  belongs_to :beer,
             inverse_of: :kegs
  belongs_to :keg_volume,
             inverse_of: :kegs
end
