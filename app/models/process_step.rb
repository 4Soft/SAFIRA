# -*- encoding : utf-8 -*-
class ProcessStep < ActiveRecord::Base
  attr_accessible :close_date, :description, :name, :open_date

  has_many :feedbacks
  has_and_belongs_to_many :candidates
  belongs_to :selection_process

  def generate_feedback(feedback)
    FeedbackMailer.send_public_feedback(feedback).deliver
  end
end
