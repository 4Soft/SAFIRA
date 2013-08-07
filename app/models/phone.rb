# -*- encoding : utf-8 -*-
class Phone < ActiveRecord::Base
  attr_accessible :number

  belongs_to :user
end
