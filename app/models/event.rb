class Event < ActiveRecord::Base
  attr_accessible :description, :name, :initial_date, :final_date
end
