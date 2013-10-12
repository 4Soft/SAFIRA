class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.boolean :type_release
      t.decimal :value
      t.text :description
      t.integer :form_payment
      t.date :date_release
      t.integer :doc_number
      t.integer :doc_type
      t.integer :origin_destination
      t.references :cashier

      t.timestamps
    end
  end
end
