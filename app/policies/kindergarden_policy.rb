class KindergardenPolicy < ApplicationPolicy

  def create?
    user.has_role?(:admin) or user.has_role?(:nutitionist) 
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:admin)
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end

  end
end
