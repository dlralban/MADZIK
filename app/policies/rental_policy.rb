class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.instrument.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end
end
