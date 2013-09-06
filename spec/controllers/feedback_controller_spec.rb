# -*- encoding : utf-8 -*-
require 'spec_helper'

describe FeedbackController do

  describe "GET 'eval_candidate'" do
    it "returns http success" do
      get 'eval_candidate'
      response.should be_success
    end
  end

end
