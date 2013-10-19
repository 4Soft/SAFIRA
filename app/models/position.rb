class Position < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date
  
  belongs_to :entrepreneur

  scope :active, where(end_date: nil)
  scope :inactive, where("end_date <> ''")
end
