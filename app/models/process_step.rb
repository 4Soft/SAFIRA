# -*- encoding : utf-8 -*-
class ProcessStep < ActiveRecord::Base
  attr_accessible :close_date, :description, :name, :open_date, :order_number

  has_many :feedbacks
  has_and_belongs_to_many :candidates
  belongs_to :selection_process

  def consolidate_step!
    candidates.find_each do |cand|
      FeedbackMailer.send_public_feedback(feedback).deliver

      feedback = Feedback.where(candidate_id: cand.id, process_step_id: id)

      #fazer a logica de jogar pra proxima etapa
    end
  end

  def consolidated?
    Time.now > close_date
  end

end
