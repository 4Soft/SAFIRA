class SelectionProcessObserver < ActiveRecord::Observer
  observe :selection_process

  def new_candidate(candidate)
    CandidateMailer.send_confirmation(candidate).deliver
  end
end