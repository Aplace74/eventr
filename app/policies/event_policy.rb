class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(user: user)
    end
  end

  def show?
    true
  end

  def invitation?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end
end
