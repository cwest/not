class User
  class Welcomer < Service::Base
    def perform
      return user if send_welcome_email
    end

    private

    def send_welcome_email
      UserRegistrationsMailer.welcome(user).deliver_later
    end
  end
end
