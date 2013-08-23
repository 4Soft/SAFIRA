class ProcessStepsController < ApplicationController
  def create
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @process_step = ProcessStep.new(params[:process_step])

    @process_step.selection_process = @selection_process

    @process_step.save

    redirect_to @selection_process
  end
end
