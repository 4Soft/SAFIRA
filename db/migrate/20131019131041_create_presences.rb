class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.boolean :present

      t.timestamps
    end
  end
end
