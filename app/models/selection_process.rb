# -*- encoding : utf-8 -*-
class SelectionProcess < ActiveRecord::Base
  after_create :create_inscription_step

  attr_accessible :close_date, :description, :open_date, :semester, :year

  has_attached_file :edict,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{enterprise.name}/#{year}-#{semester}/edital/#{edict.original_filename}" }, :unique_filename => true
    }

  attr_accessible :edict, :edict_content_type, :edict_file_name, :edict_file_size

  belongs_to :enterprise, class_name: "User"
  has_many :process_steps
  has_many :candidates

  def full_name
    year.to_s + "." + semester.to_s + " " + enterprise.name
  end

  def add_candidate(candidate)
    candidate.selection_process = self

    if candidate.save
      notify_observers(:new_candidate)
      return true
    else
      return false
    end
  end

  private
  
  def create_inscription_step
    inscription = ProcessStep.new(name: "Inscrições", description: "edite-me")
    self.process_steps << inscription
  end
end
