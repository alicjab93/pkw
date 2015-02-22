class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
	if user.role == "admin"
		can :manage, [Province, Committee, Constituency]
  elsif user.role == "okw"
    can [:manage], Constituency, :id => user.constituency_id 
    can [:manage], [ValidVote, InvalidVote], :constituency_id => user.constituency_id 
  elsif user.role == "ckw"
		can [:index, :show], [Province, Committee, Constituency]
	end

  end
end