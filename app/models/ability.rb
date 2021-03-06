class Ability
  include CanCan::Ability

    def initialize(user)
    user ||= User.new
        if user.role? :admin
            can :manage, :all
            can :edit, :all
        else
            can :read, :all
            can :create, :all
            can :manage, Post, :user_id=>user.id
            can :manage, Comment, :user_id=>user.id
            can :manage, Friendship, :user_id=>user.id
        end
    end
end
