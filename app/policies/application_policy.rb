class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def any
    true
  end

  def none
    false
  end

  def logged_in?
    !user.blank?
  end

  def owner?
    record.users.with_role('owner').where(id: user.id).exists?
  end

  [:index?, :create?, :update?, :destroy?].each do |action|
    alias_method action, :none
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
