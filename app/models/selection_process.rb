class SelectionProcess < ActiveRecord::Base
  attr_accessible :close_date, :description, :open_date, :semester, :year

  has_attached_file :edict,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {
      :path => proc { |style| "#{selection_process.enterprise.name}/#{selection_process.year}-#{selection_process.semester}/edital/#{edict.original_filename}" }, :unique_filename => true
    }

  attr_accessible :edict, :edict_content_type, :edict_file_name, :edict_file_size

  belongs_to :enterprise
  has_many :process_steps
  has_many :candidates
end
