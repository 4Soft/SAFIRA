# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ProcessStepsController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
