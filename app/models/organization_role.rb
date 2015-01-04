class OrganizationRole < ActiveRecord::Base
  has_many :organization_users,
           inverse_of: :organization_role
  has_many :users,
           through:    :organization_users,
           inverse_of: :organization_roles
  has_many :organizations,
           through:    :organization_users,
           inverse_of: :organization_roles
end
