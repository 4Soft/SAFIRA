# -*- encoding : utf-8 -*-
class SelectionProcessesController < ApplicationController

  def show
    @selection_process = SelectionProcess.find(params[:id])
  end

  def index
    @selection_processes = SelectionProcess.all
  end

  def new
    @selection_process = SelectionProcess.new
  end

  def create
    @selection_process = SelectionProcess.new(params[:selection_process])
    @selection_process.enterprise = current_user

    @selection_process.save
    
    redirect_to @selection_process
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
