class Release < ActiveRecord::Base
  attr_accessible :date_release, :description, :doc_number, :doc_type, :form_payment, :origin_destination, :type_release, :value
  belongs_to :cashier
end
