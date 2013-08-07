# -*- encoding : utf-8 -*-
class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :value
      t.references :user

      t.timestamps
    end
  end
end
