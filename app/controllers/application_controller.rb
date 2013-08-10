# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :choose_layout

  def after_sign_in_path_for(resource)
  	users_dashboard_path
  end

  def choose_layout
    if user_signed_in?
      "application"
    else
      "visitors"
    end
  end

  def current_profile 
    current_user.profileable if user_signed_in?
  end

  def current_profile_name
    current_user.profileable_type.downcase.pluralize if user_signed_in?
  end

  def authenticate_admin;      authenticate('Admin')     end
  def authenticate_enterprise; authenticate('Enterprise') end

  def authenticate(role)
    flash[:message] = "Access denied"
    redirect_to new_user_session_path unless current_user.try(:profileable_type).eql? role
  end
end
