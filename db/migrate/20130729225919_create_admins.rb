# -*- encoding : utf-8 -*-
class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|

      t.timestamps
    end
  end
end
