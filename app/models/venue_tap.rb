class VenueTap < ActiveRecord::Base
  belongs_to :venue,
             inverse_of: :venue_taps
  belongs_to :keg,
             inverse_of: :venue_tap
end
