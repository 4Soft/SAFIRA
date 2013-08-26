# -*- encoding : utf-8 -*-
class CreateSelectionProcesses < ActiveRecord::Migration
  def change
    create_table :selection_processes do |t|
      t.text :call
      t.string :name
      t.attachment :edict
      t.datetime :consolidated_at
      t.boolean :consolidated
      
      t.references :enterprise

      t.timestamps
    end
  end
end
