class LifePolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  # only the owner of a life can update and destroy
  def update?
    record.user == user
    # record: the life passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
