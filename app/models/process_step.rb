# -*- encoding : utf-8 -*-
class ProcessStep < ActiveRecord::Base
  attr_accessible :close_date, :description, :name, :open_date, :order_number
                  :consolidated

  has_many :feedbacks
  has_and_belongs_to_many :candidates
  belongs_to :selection_process

  scope :consolidated, where(consolidated: true)
  scope :not_consolidated, where(consolidated: false)

  def consolidate_step!
    self.consolidated = true
    self.close_date = Time.now
    
    candidates.find_each do |cand|
      feedback = Feedback.where(candidate_id: cand.id, process_step_id: id).first
      FeedbackMailer.send_public_feedback(feedback).deliver
    end

    next_step = get_next_step

    if next_step
      next_step.candidates += self.approved_candidates
    end

    self.save
  end

  def get_next_step
    self.selection_process.process_steps.where(order_number: self.order_number + 1).first
  end

  def approved_candidates
    result = []

    candidates.find_each do |cand|
      feedback = Feedback.where(candidate_id: cand.id, process_step_id: id).first
        
      result << cand if feedback.approved?
    end

    result
  end

  def delayed?
    Time.now > close_date
  end

end
