class Venue < ActiveRecord::Base
  has_many :kegs,
           inverse_of: :venue
  has_many :venue_taps,
           inverse_of: :venue

  belongs_to :organization,
             inverse_of: :venues
end
