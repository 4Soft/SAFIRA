# -*- encoding : utf-8 -*-
class SelectionProcess < ActiveRecord::Base
  attr_accessible :call, :name, :consolidated, :consolidated_at
  attr_accessible :edict, :edict_content_type, :edict_file_name, :edict_file_size

  has_attached_file :edict,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{enterprise.name}/#{full_name}/edital/#{edict.original_filename}" }, :unique_filename => true
    }

  has_many :candidates
  belongs_to :enterprise, class_name: "User"
  has_many :process_steps

  scope :consolidated, where(consolidated: true)
  scope :not_consolidated, where(consolidated: false)

  validates_presence_of :edict, :call, :name, :enterprise_id

  def full_name
    "#{name} #{enterprise.name}"
  end

  def approved_candidates
    self.process_steps.order('order_number asc').first.approved_candidates
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

  def consolidate_process!
    process_steps.each do |step|
      raise "Nem todos os passos foram consolidados!" unless step.consolidated?
    end

    self.consolidated = true
    self.consolidated_at = Time.now
    self.save
  end

  def to_param
    "#{id} #{full_name}".parameterize
  end
end
