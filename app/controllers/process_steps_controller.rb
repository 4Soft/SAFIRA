# -*- encoding : utf-8 -*-
class ProcessStepsController < ApplicationController
  def show
    @process_step = ProcessStep.find(params[:id])
    @selection_process = @process_step.selection_process

    @feedback = Feedback.new
  end

  def create
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @process_step = ProcessStep.new(params[:process_step])

    @process_step.selection_process = @selection_process

    last_step = @selection_process.process_steps.order(:order_number).last

    @process_step.order_number = last_step.order_number + 1

    if last_step.consolidated?
      @process_step.candidates += last_step.approved_candidates
    end

    @process_step.save

    redirect_to @selection_process
  end

  def consolidate_step
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @process_step = @selection_process.process_steps.find(params[:process_step_id])

    begin
      @process_step.consolidate_step!
      redirect_to @selection_process
    rescue Exception => e
      flash[:error] = e.message
      redirect_to [@selection_process, @process_step]
    end

  end
end