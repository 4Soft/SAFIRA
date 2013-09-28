class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name

  has_many :presences
end
