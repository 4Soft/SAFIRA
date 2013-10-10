class Release < ActiveRecord::Base
  attr_accessible :date_release, :description, :doc_number, :doc_type, :form_payment, :origin_destination, :type_release, :value
  
  validates :value, presence: true, numericality: true, message: "Precisa constar o valor da nota."
  validates :description, presence: true, message: "Precisa constar a descrição da nota."
  validates :doc_number, presence: true, uniqueness: true, message: "Precisa constar o numero do documento."

  belongs_to :cashier
end
