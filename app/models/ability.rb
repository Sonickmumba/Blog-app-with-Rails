class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment] # start by defining rules for all users, also not logged ones

    return unless user.present?

    can :create, Post
    can :create, Comment
    can :update, Like
    can :destroy, Post, author_id: user.id # if the user is logged in can destroy it's own posts
    can :destroy, Comment, author_id: user.id # if the user is logged in can destroy it's own comments

    return unless user.admin?

    can :manage, :all # finally we give all remaining permissions only to the admins to every resource
  end
end
