class SocialNetwork < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :user
end
