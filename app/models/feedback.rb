# -*- encoding : utf-8 -*-
class Feedback < ActiveRecord::Base
  attr_accessible :private, :public, :approved, :send_email
  
  belongs_to :candidate
  belongs_to :process_step
end
