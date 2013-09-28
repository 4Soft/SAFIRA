class Event < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :date, :description, :name

  has_many :presences
=======
  attr_accessible :description, :name, :initial_date, :final_date
>>>>>>> 03d614ed827e14fd33d35f7a93a69a0926bee35d
end
