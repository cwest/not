class OrganizationUser < ActiveRecord::Base
  belongs_to :user,
             inverse_of: :organization_users
  belongs_to :organization,
             inverse_of: :organization_users
  belongs_to :organization_role,
             inverse_of: :organization_users
end
