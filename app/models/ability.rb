class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
	if user.role == "admin"
		can :manage, [Province, Committee, Constituency]
  elsif user.role == "okw"
    can [:show, :update], Constituency, :user_id => user.id    
	end

  end
end