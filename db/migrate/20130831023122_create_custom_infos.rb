# -*- encoding : utf-8 -*-
class CreateCustomInfos < ActiveRecord::Migration
  def change
    create_table :custom_infos do |t|
      t.string :name
      t.string :value

      t.references :custom_infoable, polymorphic: true

      t.timestamps
    end
  end
end
