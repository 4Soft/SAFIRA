# -*- encoding : utf-8 -*-
class SocialNetwork < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :user
end
