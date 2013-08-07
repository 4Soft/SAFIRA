# -*- encoding : utf-8 -*-
class CreateCandidatesProcessStepsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :candidates_process_steps, :id => false do |t|
      t.references :candidate
      t.references :process_step
    end
    add_index :candidates_process_steps, [:candidate_id, :process_step_id], name: "candidate_id_on_process"
    add_index :candidates_process_steps, :process_step_id
  end

  def self.down
    drop_table :candidates_process_steps
  end
end
