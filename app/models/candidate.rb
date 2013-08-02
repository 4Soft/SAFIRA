class Candidate < ActiveRecord::Base
  attr_accessible :course, :curriculum, :description, :email, :name

  has_and_belongs_to_many :process_steps
end
