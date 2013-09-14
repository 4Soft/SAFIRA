class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :entrepreneur
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
    add_index :positions, :entrepreneur_id
  end
end
