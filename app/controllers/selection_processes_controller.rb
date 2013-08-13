# -*- encoding : utf-8 -*-
class SelectionProcessesController < ApplicationController
  def show
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @candidate = Candidate.find(params[:id])
  end

  def new
    @selection_process = SelectionProcess.new
  end

  def create
    @selection_process = SelectionProcess.create(params[:selection_process])
  end

  def edit
    @selection_process = SelectionProcess.find(params[:id])
  end

  def update
    @selection_process = SelectionProcess.find(params[:id])
    @selection_process.update_attributes(params[:selection_process])
  end

  def destroy
    @selection_process = SelectionProcess.find(params[:id])
    @selection_process.destroy
  end
end
