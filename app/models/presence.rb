class Presence < ActiveRecord::Base
  belongs_to :event_presence
  belongs_to :entrepreneur
  attr_accessible :present
end
