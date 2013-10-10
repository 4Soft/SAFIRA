class Release < ActiveRecord::Base
  attr_accessible :date_release, :description, :doc_number, :doc_type, :form_payment, :origin_destination, :type_release, :value
  
  validates :value, presence: true, numericality: true
  validates :description, presence: true
  validates :doc_number, presence: true

  belongs_to :cashier
end
