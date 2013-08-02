class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :about, :address

  acts_as_taggable_on :permissions

  has_many :phones
  has_many :social_networks
end
