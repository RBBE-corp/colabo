class ContributionPolicy < ApplicationPolicy
  attr_reader :user, :record
  # contribution policy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    true
  end

  # def new?
  #   create?
  # end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    user == record.user
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
