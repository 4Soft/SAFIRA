# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SelectionProcess do
  before(:each) do 
    SelectionProcess.any_instance.stub(:save_attached_files).and_return(true)
  end

  it "test add_candidate with a valid candidate" do
    selection = create(:selection_process)
    selection.add_candidate(build(:candidate)).should be(true)

    selection.reload

    selection.candidates.count.should be == 1
  end

  it "test add_candidate with a invalid candidate" do
    selection = create(:selection_process)
    selection.add_candidate(build(:candidate, curriculum: nil))
      .should be(false)

    selection.reload

    selection.candidates.count.should be == 0
  end

  it "should always create a inscription step when created" do
    selection = build(:selection_process)
    selection.save

    selection.reload

    selection.process_steps.count.should be == 1
    selection.process_steps.first.name.should eq("Inscrições")
  end
end

#Olha aí
# before(:each) do 
#   @sheet = double('sheet')
#   @sheet.stub(:url).and_return(File.join(Rails.root, 'spec','fixtures','files', 'file.xls'))
#   active_record_object.stub(:sheet).and_return(@sheet)
# end