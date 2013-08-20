# -*- encoding : utf-8 -*-
class SelectionProcessForm
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :selection_process
  attr_reader :inscription

  attribute :selection_process_name, String
  attribute :selection_process_description, String
  attribute :selection_process_edict, File
  attribute :selection_process_enterprise, Enterprise

  attribute :inscription_description, String
  attribute :inscription_open_date, String
  attribute :inscription_close_date, File

  #validates :selection_process_name, presence: true
  #validates :selection_process_edict, presence: true

  #validates :inscription_open_date, presence: true
  #validates :inscription_close_date, presence: true
  # … more validations …

  # Forms are never themselves persisted
  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

private

  def persist!
    @selection_process = SelectionProcess.new(name: selection_process_name, 
      description: selection_process_description, edict: selection_process_edict)
    @selection_process.enterprise = selection_process_enterprise
    @selection_process.save!

    @inscription = @selection_process.process_steps.create!(name: "Inscrições",
      description: inscription_description, open_date: inscription_open_date,
       close_date: inscription_close_date)
  end
end

  #attr_accessor :selection_process_name, :selection_process_description, :selection_process_edict,
   #             :inscription_description, :inscription_open_date, :inscription_close_date
