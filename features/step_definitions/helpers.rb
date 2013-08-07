# -*- encoding : utf-8 -*-
#encoding: UTF-8

def create_visitor
  @visitor ||= {:email => "example@example.com", :password => "changeme", :password_confirmation => "changeme", :name => "example" }
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "ENTRAR"
end
