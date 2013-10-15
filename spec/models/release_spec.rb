# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Release do
  #before(:each) do
  #	 Releases.any_instance.stub(:save_attached_files).and_return(true)
  #end
  
  it {should belong_to :cashier}
  
end
