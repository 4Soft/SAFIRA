class FeedbackController < ApplicationController
  def eval_candidate
    @selection_process = SelectionProcess.find(params[:selection_process_id])
    @process_step = ProcessStep.find(params[:process_step_id])
    @feedback = Feedback.new(params[:feedback])
    @candidate = Candidate.find(params[:cand_id])

    @feedback.candidate = @candidate
    @feedback.process_step = @process_step

    if @feedback.save
      @process_step.generate_feedback(@feedback)

      redirect_to [@selection_process, @process_step]
    end
  end
end
