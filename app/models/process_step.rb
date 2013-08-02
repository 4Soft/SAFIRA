class ProcessStep < ActiveRecord::Base
  attr_accessible :close_date, :description, :name, :open_date

  has_and_belongs_to_many :candidates
end
