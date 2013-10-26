class Presence < ActiveRecord::Base
  attr_accessible :present, :entrepreneur, :event

  belongs_to :entrepreneur
  belongs_to :event
end
