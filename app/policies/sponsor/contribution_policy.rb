class Sponsor::ContributionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    if user == record.user
      true
    else
      false
    end
  end

  def update?
    if user == record.project.user
      true
    else
      false
    end
  end

  def destroy?
    if user == record.user
      true
    else
      false
    end
  end
end
