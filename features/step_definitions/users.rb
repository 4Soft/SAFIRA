# -*- encoding : utf-8 -*-
# -*- coding: UTF-8 -*-

require_relative "helpers"

Given(/^I do not exist as an user$/) do
  create_visitor
  delete_user
end

When(/^I sign in with valid credentials$/) do
  sign_in
end

Then(/^I see an invalid login message$/) do
  page.should have_content "E-mail ou senha inválidos."
end

Given(/^I exist as an user$/) do
  create_user
end

Then(/^I should be signed in$/) do
  page.should have_content @user[:email]
  page.should have_content "Fechar Sessão"
end

When(/^I sign in with a wrong email$/) do
  create_user
  visit "/users/sign_in"
  fill_in "user_email", :with => "wrong@email.com"
  fill_in "user_password", :with => @visitor[:password]
  click_button "ENTRAR"
end

When(/^I sign in with a wrong password$/) do
  create_user
  visit "/users/sign_in"
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => "wrong_password"
  click_button "ENTRAR"
end

Given(/^I exist as an user and I'm signed in$/) do
  create_user
  sign_in
end

When(/^I sign out$/) do
  click_link "Fechar Sessão"
end

Then(/^I should see a signed out message$/) do
  page.should have_content "Saiu com sucesso."
end

When(/^I return to the application$/) do
  visit "/"
end

Then(/^I should be signed out$/) do
  page.should have_content "Login"
  page.should_not have_content "Fechar Sessão"
end
