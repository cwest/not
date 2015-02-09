class Organization < ActiveRecord::Base
  has_many :organization_users,
           inverse_of: :organization
  has_many :organization_roles,
           through:    :organization_users,
           inverse_of: :organizations

  with_role_extension = proc do
    extending Factory::WithRoleExtension.build(
      mapping_association: :organization_users,
      role_association:    :organization_role
    )
  end
  has_many :users, with_role_extension,
           through:    :organization_users,
           inverse_of: :organizations

  has_many :venues,
           inverse_of: :organization
end
