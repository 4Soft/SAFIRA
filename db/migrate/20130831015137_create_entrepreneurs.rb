class CreateEntrepreneurs < ActiveRecord::Migration
  def change
    create_table :entrepreneurs do |t|
      t.string :name
      t.string :personal_email
      t.string :professional_email
      t.references :enterprise

      t.timestamps
    end
  end
end
