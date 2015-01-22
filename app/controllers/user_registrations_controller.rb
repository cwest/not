class UserRegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    welcome_user(resource) if super
  end

  private

  def welcome_user(user)
    User::Welcomer.new(user: user).call
  end
end
