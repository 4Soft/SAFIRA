# -*- encoding : utf-8 -*-
class SelectionProcess < ActiveRecord::Base
  after_create :create_inscription_step

  attr_accessible :description, :name

  has_attached_file :edict,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{enterprise.name}/#{year}-#{semester}/edital/#{edict.original_filename}:basename.:extension" }, :unique_filename => true
    }

  attr_accessible :edict, :edict_content_type, :edict_file_name, :edict_file_size

  has_many :candidates
  belongs_to :enterprise, class_name: "User"
  has_many :process_steps

  def full_name
    "#{name} #{enterprise.name}"
  end

  def add_candidate(candidate)
    candidate.selection_process = self

    token = SecureRandom.hex

    while (Candidate.find_by_confirmation_register_token(token))
      token = SecureRandom.urlsafe_base64
    end

    candidate.confirmation_register_token = token
    candidate.register_confirmation_sent_at = Time.now

    if candidate.save
      CandidateMailer.send_confirmation(self, candidate).deliver
      return true
    else
      return false
    end
  end

  def to_param
    "#{id} #{full_name}".parameterize
  end

  private
  
  def create_inscription_step
    inscription = ProcessStep.new(name: "Inscrições", description: "edite-me")
    self.process_steps << inscription
  end
end
