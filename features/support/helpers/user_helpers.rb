module UserHelpers
  attr_writer :current_user

  def create_visitor
    Fabricate.to_params(:user)
  end

  def find_user
    self.current_user = User.where(email: visitor[:email]).first
  end

  def create_user
    Fabricate(:user, password: password)
  end

  def password
    'password1'
  end

  def visitor
    @visitor ||= create_visitor
  end

  def current_user
    @current_user ||= create_user
  end
end

World(UserHelpers)
