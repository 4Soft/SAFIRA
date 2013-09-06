# -*- encoding : utf-8 -*-
class CustomInfo < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :custom_infoable, polymorphic: true
end
