class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :new, :create], User
    if user
      can [:new, :create], Message
      can :read, Message, :user_id => user.id
      can [:new, :create], Record
      can :manage, Record, :owner_id => user.id
      can :read, Record, id: user.accessible_records.pluck(:id)
    end
  end
end
