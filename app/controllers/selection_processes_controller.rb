# -*- encoding : utf-8 -*-
class SelectionProcessesController < ApplicationController

  def show
    @selection_process = SelectionProcess.find(params[:id])
  end

  def index
    # REFATORAR!
    if params[:done].nil?
      @selection_processes = SelectionProcess.all
    elsif params[:done] == "true"
      @selection_processes = SelectionProcess.all.select { |sp| sp.done }
    else
      @selection_processes = SelectionProcess.all.reject { |sp| sp.done }
    end
  end

  def new
    @selection_process_form = SelectionProcessForm.new
  end

  def create
    @selection_process_form = SelectionProcessForm.new(
      params[:selection_process_form].merge(selection_process_enterprise: current_user))
    @selection_process_form.inscription_open_date = 
      params[:selection_process_form][:inscription_open_date].to_datetime

    raise Exception.new @selection_process_form.inscription_open_date

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
