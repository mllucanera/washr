# car should :

# only created by client
# read by client (owner of the cars)
# edit by client (owner of the car)
# update by client (owner of the car)
# delete by client (owner of the car)

class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def show?
    user_is_owner?
  end

  def create?
    user_is_client?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_client?
    user.role == 'client'
  end
end
