# -*- encoding : utf-8 -*-
class Feedback < ActiveRecord::Base
  attr_accessible :private, :public, :approved
  
  validates_presence_of :approved, :candidate_id, :process_step_id

  belongs_to :candidate
  belongs_to :process_step
end
