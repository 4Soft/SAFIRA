# -*- encoding : utf-8 -*-
class Phone < ActiveRecord::Base
  attr_accessible :number

  validates_presence_of :number, :user_id

  belongs_to :user
end
