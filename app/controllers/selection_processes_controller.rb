# -*- encoding : utf-8 -*-
class SelectionProcessesController < ApplicationController

  def show
    @selection_process = SelectionProcess.find(params[:id])
  end

  def index
    @selection_processes = SelectionProcess.all
  end

  def new
    @selection_process_form = SelectionProcessForm.new
  end

  def create
    @selection_process_form = SelectionProcessForm.new(
      params[:selection_process_form].merge(selection_process_enterprise: current_user))

    if @selection_process_form.save
      redirect_to @selection_process_form.selection_process
    else
      render :new
    end
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
