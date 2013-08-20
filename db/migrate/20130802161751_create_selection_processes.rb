# -*- encoding : utf-8 -*-
class CreateSelectionProcesses < ActiveRecord::Migration
  def change
    create_table :selection_processes do |t|
      t.text :description
      t.string :name
      t.attachment :edict
      
      t.references :enterprise

      t.timestamps
    end
  end
end
