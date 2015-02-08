# TODO: Seed data for keg volume specifications: https://en.wikipedia.org/wiki/Keg#Beer_keg
class KegVolume < ActiveRecord::Base
  has_many :kegs,
           inverse_of: :keg_volume
end
