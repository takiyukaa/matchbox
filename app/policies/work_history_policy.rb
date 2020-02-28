class WorkHistoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
    true
  end

  def edit?
    user_is_owner_of_record?
  end

  def update?
    edit?
  end

  def destroy?
    user_is_owner_of_record?
  end

  private

  def user_is_owner_of_record?
   record.user == user
  end

end
