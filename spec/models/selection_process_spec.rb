# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SelectionProcess do
  before(:each) do 
    #SelectionProcess.any_instance.stub(:save).and_return(true)
    SelectionProcess.any_instance.stub(:save_attached_files).and_return(true)
  end

  it "should add candidate with a valid candidate" do
    selection = create(:selection_process)
    selection.add_candidate(build(:candidate)).should be(true)

    selection.candidates.count.should be == 1
  end

  it "should add candidate with a invalid candidate" do
    selection = create(:selection_process)
    selection.add_candidate(build(:candidate, curriculum: nil))
      .should be(false)

    selection.candidates.count.should be == 0
  end

  it "should always create a inscription step when created" do
    selection = build(:selection_process)
    selection.should_receive(:create_inscription_step).and_call_original
    selection.save

    selection.process_steps.count.should be == 1
    selection.process_steps.first.name.should eq("Inscrições")
  end
end
