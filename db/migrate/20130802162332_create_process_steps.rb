class CreateProcessSteps < ActiveRecord::Migration
  def change
    create_table :process_steps do |t|
      t.text :description
      t.string :name
      t.datetime :open_date
      t.datetime :close_date
      t.references :selection_process

      t.timestamps
    end
  end
end
