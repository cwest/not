class Venue < ActiveRecord::Base
  belongs_to :organization,
             inverse_of: :venues
end
