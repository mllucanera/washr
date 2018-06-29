# booking should :

# only created by client
# read by client and washr (when is not picked)
# NO EDIT
# NO UPDATE
# NO DELETE


class BookingPolicy < ApplicationPolicy
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

  def booking_free?
    record.status == 'washer_pending'
  end

  def user_is_owner?
    record.user == user
  end

  def user_is_client?
    user.role == 'client'
  end
end
