# -*- encoding : utf-8 -*-
class Candidate < ActiveRecord::Base
  attr_accessible :course, :description, :email, :name

  validates_presence_of :name

  has_attached_file :curriculum,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{selection_process.enterprise.name}/#{selection_process.year}-#{selection_process.semester}/curriculos/#{name.capitalize}-#{email}" }, :unique_filename => true
    }

  attr_accessible :curriculum, :curriculum_content_type, :curriculum_file_name, :curriculum_file_size

  belongs_to :selection_process
  has_and_belongs_to_many :process_steps
end
