# -*- encoding : utf-8 -*-
class Candidate < ActiveRecord::Base
  attr_accessible :course, :description, :email, :name
  attr_accessible :curriculum, :curriculum_content_type, :curriculum_file_name, :curriculum_file_size

  has_attached_file :curriculum,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{selection_process.enterprise.name}/#{selection_process.full_name}/curriculos/#{name.capitalize}-#{email}:basename.:extension" }, :unique_filename => true
  }

  validates_presence_of :name, :email, :course, :curriculum

  belongs_to :selection_process
  has_and_belongs_to_many :process_steps

  def register_confirmed?
    not register_confirmed_at.blank?
  end

  def confirm(confirmation_token)
    return if register_confirmed?

    candidate = Candidate.find_by_confirmation_register_token(confirmation_token)
    candidate.register_confirmed_at = Time.now

    candidate.selection_process.process_steps.first.candidates << candidate

    if candidate.save
      return true
    else
      return false
    end
  end
end
