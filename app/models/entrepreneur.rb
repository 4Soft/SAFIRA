# -*- encoding : utf-8 -*-
class Entrepreneur < ActiveRecord::Base
  attr_accessible :name, :personal_email, :professional_email, :custom_infos

  belongs_to :enterprise, class_name: "User"
  has_many :custom_infos, as: :custom_infoable
end
