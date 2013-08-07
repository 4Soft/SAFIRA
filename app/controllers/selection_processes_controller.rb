# -*- encoding : utf-8 -*-
class SelectionProcessesController < ApplicationController 
  def show
    @selection_process = SelectionProcess.find(params[:id])
  end

  def register_candidate
    @selection_process = SelectionProcess.find(params[:id])
    @candidate = Candidate.new(params[:candidate])

    if @selection_process.add_candidate(@candidate)
      flash[:message] = "Cadastro de boa"
      redirect_to @candidate
    else
      flash[:message] = "Cadastro deu ruim"
      render action: :show
    end
  end
end
