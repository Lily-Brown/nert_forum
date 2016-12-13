class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :crud, Post
      can :crud, Comment
      can [:read, :update], User
    end

  end
end
