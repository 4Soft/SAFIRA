# -*- encoding : utf-8 -*-
class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :email, null: false
      t.string :name
      t.text :description
      t.attachment :curriculum
      t.string :course

      t.string :confirmation_register_token
      t.datetime :register_confirmed_at
      t.datetime :register_confirmation_sent_at

      t.references :selection_process

      t.timestamps
    end

    add_index :candidates, :email
    add_index :candidates, :confirmation_register_token, unique: true
  end
end
