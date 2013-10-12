class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.decimal :opening_balance
      t.references :enterprise     

      t.timestamps
    end
  end
end