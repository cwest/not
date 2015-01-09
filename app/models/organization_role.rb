class OrganizationRole < ActiveRecord::Base
  has_many :organization_users,
           inverse_of: :organization_role
  has_many :users,
           through:    :organization_users,
           inverse_of: :organization_roles
  has_many :organizations,
           through:    :organization_users,
           inverse_of: :organization_roles

  def self.owner
    find_or_create_by(name: 'owner')
  end
end
