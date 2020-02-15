class InstrumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    @create
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end
end
