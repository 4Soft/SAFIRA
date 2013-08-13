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

  def authenticate_admin;      authenticate('Admin')     end
  def authenticate_enterprise; authenticate('Enterprise') end

  def authenticate(role)
    flash[:message] = "Access denied"
  end
end
