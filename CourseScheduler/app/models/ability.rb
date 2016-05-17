class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new
   if (user.roles_mask == 3)
     can :manage, :all
#   elsif user.has_role? :instructor
   elsif (user.roles_mask == 2)
     can :manage, Course # author can create status
     # author can update status
     # can :destroy, Status # #uncomment this line, author can destroy status
#     can :read, :all
     can :read, User
     can :edit, User
     can :index, User
     can :instructor_index, User
     can :instructor_update, User
     can :show, User
     can :update, User
   else
     can :manage, User
     can :add_course, User
     can :schedule_add, Course
     can :index, User
     can :show, User
#     can :read, :all
     can :schedule_course, Course
   end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
