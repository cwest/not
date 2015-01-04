class User < ActiveRecord::Base
  has_paper_trail

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  # ActiveJob Compatibility
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  has_many :organization_users,
           inverse_of: :user
  has_many :organization_roles,
           through:    :organization_users,
           inverse_of: :users

  with_role_extension = proc do
    extending Factory::WithRoleExtension.build(
      mapping_association: :organization_users,
      role_association:    :organization_role
    )
  end
  has_many :organizations, with_role_extension,
           through:    :organization_users,
           inverse_of: :users
end
