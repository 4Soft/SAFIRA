# -*- encoding : utf-8 -*-
class ProcessStep < ActiveRecord::Base
  attr_accessible :description, :name, :open_date, :order_number,
                  :consolidated, :consolidated_at

  has_many :feedbacks
  has_and_belongs_to_many :candidates
  belongs_to :selection_process

  scope :consolidated, where(consolidated: true)
  scope :not_consolidated, where(consolidated: false)

  validates_presence_of :description, :name, :open_date, :order_number, :selection_process_id

  def consolidate_step!
    cand_feedback = {}

    candidates.each do |cand|
      unless cand_feedback[cand] = Feedback.where(candidate_id: cand.id, process_step_id: id).first
        raise "Nem todos os candidatos foram avaliados!" 
      end
    end

    self.consolidated = true
    self.consolidated_at = Time.now    

    cand_feedback.each do |cand, feed|
      FeedbackMailer.send_public_feedback(feed).deliver if feed.send_email?
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
    not consolidated and Time.now > consolidated_at
  end

end
