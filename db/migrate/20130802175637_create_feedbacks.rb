class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :public
      t.text :private
      t.references :candidate
      t.references :process_step

      t.timestamps
    end
    add_index :feedbacks, :candidate_id
    add_index :feedbacks, :process_step_id
  end
end
