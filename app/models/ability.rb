class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
	if user.role == "admin"
		can :manage, [Province, Committee, Constituency]
	end

  end
end