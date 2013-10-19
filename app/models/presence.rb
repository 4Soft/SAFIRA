class Presence < ActiveRecord::Base
  attr_accessible :present

  belongs_to :entrepreneur
  belongs_to :event
end
