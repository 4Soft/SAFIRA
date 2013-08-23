# -*- encoding : utf-8 -*-
class ProcessStepsController < ApplicationController
  def show
    @process_step = ProcessStep.find(params[:id])
    @selection_process = @process_step.selection_process
  end

  def create
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @process_step = ProcessStep.new(params[:process_step])

    @process_step.selection_process = @selection_process

    @process_step.save

    redirect_to @selection_process
  end

  def consolidate
  end
end