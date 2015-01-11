class OrganizationForm < Reform::Form
  property :name, validates: {
    presence: true
  }

  validates_uniqueness_of :name
end
