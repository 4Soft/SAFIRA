class Presence < ActiveRecord::Base
  belongs_to :event
  belongs_to :entrepreneur
  attr_accessible :present
end
