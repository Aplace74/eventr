class ContributionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      fail
    end
  end

  def create?
    true
  end
end
