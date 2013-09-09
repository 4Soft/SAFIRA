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



=begin
def hue
  h = {
    'Ecosin' => 'ecosin.sa@gmail.com',
    'Adm Consult' => 'contato@admconsult.com.br',
    'Doc Ctrl' => 'doc.ctrl.ufrn@gmail.com',
    'Start EJ' => 'startejcontato@gmail.com',
    'Caroá' => 'caroadesign@gmail.com'
  }

  h.each do |k, v|
    Enterprise.create(name: k, email: v, password: 'safira-alpha')
  end
end
=end
