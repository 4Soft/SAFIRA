class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.integer :opening_balance
      t.references :enterprise     

      t.timestamps
    end
  end
end