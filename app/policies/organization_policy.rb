class OrganizationPolicy < ApplicationPolicy
  alias_method :index?,   :any
  alias_method :create?,  :logged_in?
  alias_method :update?,  :owner?
  alias_method :destroy?, :owner?

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
