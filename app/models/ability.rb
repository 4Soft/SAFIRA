# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    #TODO, PERMISSOES TODAS

    can :manage, :selection_process if user.permission_list.include?('gerps')    
    can :manage, :portfolio if user.permission_list.include?('gerportfolio')
  end
end
