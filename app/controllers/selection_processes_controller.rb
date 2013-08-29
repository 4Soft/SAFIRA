# -*- encoding : utf-8 -*-
class SelectionProcessesController < ApplicationController

  def show
    @selection_process = SelectionProcess.find(params[:id])
  end

  def index
    sel_processes = SelectionProcess.where(enterprise_id: current_user.id)

    if params[:done].nil?
      @selection_processes = sel_processes
    elsif params[:done] == "true"
      @selection_processes = sel_processes.consolidated
    else
      @selection_processes = sel_processes.not_consolidated
    end
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

  def consolidate_process
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @selection_process.consolidate_process!

    redirect_to @selection_process
  end
end
