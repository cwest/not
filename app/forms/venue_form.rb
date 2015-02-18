class VenueForm < Reform::Form
  properties :name, :address, :organization_id, validates: {
    presence: true
  }

  validates_uniqueness_of :name
end
