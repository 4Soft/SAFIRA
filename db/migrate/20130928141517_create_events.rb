class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :initial_date
      t.datetime :final_date
      t.text :description

      t.timestamps
    end
  end
end
