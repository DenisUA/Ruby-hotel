class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all if user.admin
    can %i[create index], Contact
    can %i[create read update], Order, user_id: user.id
    can :read, Apartment
  end
end
