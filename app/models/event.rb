class Event < ActiveRecord::Base
  attr_accessible :description, :name, :initial_date, :final_date, :entrepreneur_ids
  has_many :presences
  has_many :entrepreneurs, through: :presences
end
