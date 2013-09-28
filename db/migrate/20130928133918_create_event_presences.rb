class CreateEventPresences < ActiveRecord::Migration
  def change
    create_table :event_presences do |t|
      t.text :name
      t.datetime :date

      t.timestamps
    end
  end
end
