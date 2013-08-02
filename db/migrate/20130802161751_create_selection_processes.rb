class CreateSelectionProcesses < ActiveRecord::Migration
  def change
    create_table :selection_processes do |t|
      t.text :description
      t.integer :year
      t.integer :semester
      t.attachment :edict
      t.datetime :open_date
      t.datetime :close_date
      t.references :enterprise

      t.timestamps
    end
  end
end
