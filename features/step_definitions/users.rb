# encoding: UTF-8
# coding: UTF-8
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
  pending # express the regexp above with the code you wish you had
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