# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Login page' do
  
  scenario 'should log on and redirect to selection processes page when user/password is correct' do
    enterprise = create(:four_soft)
    sign_in(enterprise)
    expect(page).to have_link('Sair', href: destroy_user_session_path)
  end

  scenario 'should show error message when user/password is incorrect' do
    sign_up_with('emailnadaaver@gmail.com', 'senhanadaaver')
    expect(page).to have_selector('div.alert--warning', text: 'E-mail ou senha inválidos.' )
  end
end