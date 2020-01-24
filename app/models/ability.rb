class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new
    if user.admin?
        can :manage, :all
    else
        can :update, Pin, user_id: user.id
        can :destroy, Pin, user_id: user.id
        can :destroy, Comment, user_id: user.id
        
        can :read, Pin
        can :read, Comment
        can :create, Pin
        can :create, Comment
    end
  end
end