# -*- encoding : utf-8 -*-
class SpRegisterController < ApplicationController
  def show_process
    @selection_process = SelectionProcess.find(params[:selection_process_id])
  end

  def register
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @candidate = Candidate.new(params[:candidate])

    if @selection_process.add_candidate(@candidate)
      flash[:message] = "Cadastro de boa"
      redirect_to selection_process_successful_register_path(@selection_process, x: @candidate.email)
    else
      flash[:message] = "Cadastro deu ruim"
      render action: :show_process
    end
  end

  def successful_register
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @candidate = Candidate.find_by_email(params[:x])
  end

  def confirm_register
    @candidate = Candidate.find_by_confirmation_register_token(params[:x])
    @selection_process = @candidate.selection_process

    if @candidate.confirm(params[:x])
      flash[:message] = "Confirmação de boa"
      redirect_to selection_process_successful_register_path(@selection_process, x: @candidate.email)
    else
      flash[:message] = "Confirmação deu ruim"
      render action: :show_process
    end
  end
end
