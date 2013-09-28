class EventPresence < ActiveRecord::Base
  attr_accessible :date, :name

  has_many :entrepreneurs
end
