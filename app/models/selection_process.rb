class SelectionProcess < ActiveRecord::Base
  attr_accessible :close_date, :description, :edict, :open_date, :semester, :year

  has_many :process_steps
end
