# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'CRUD Selection Processes' do

  scenario 'visitors should be redirected to log in page' do
    visit new_selection_process_path
    current_path.should == user_session_path
  end

  scenario 'create new selection process' do
    sign_in(create(:four_soft))

    visit new_selection_process_path

    within 'form' do
      fill_in 'selection_process_form_selection_process_name', with: 'Nome qualquer'
      fill_in 'selection_process_form_selection_process_call', with: 'Processo seletivo da hora'
      attach_file 'selection_process_form_selection_process_edict', Rails.root + 'spec/support/edictTest.pdf'
      fill_in 'selection_process_form_inscription_open_date', with: Time.now
      fill_in 'selection_process_form_inscription_consolidated_at', with: Time.now + 2.weeks
      click_button 'Criar Processo'
    end

    expect(page).to have_selector('h2', text: 'Nome qualquer' )
  end
end