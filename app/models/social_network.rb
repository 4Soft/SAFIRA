# -*- encoding : utf-8 -*-
class SocialNetwork < ActiveRecord::Base
  attr_accessible :name, :value

  validates_presence_of :name, :value, :user_id

  belongs_to :user
end
