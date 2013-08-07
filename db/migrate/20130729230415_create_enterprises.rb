# -*- encoding : utf-8 -*-
class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|

      t.timestamps
    end
  end
end
