class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.boolean :present
      t.references :event
      t.references :entrepreneur

      t.timestamps
    end
    add_index :presences, :event_id
    add_index :presences, :entrepreneur_id
  end
end
