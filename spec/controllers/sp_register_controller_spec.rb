# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SpRegisterController do

  describe "GET 'show_process'" do
    it "returns http success" do
      get 'show_process'
      response.should be_success
    end
  end

  describe "GET 'register'" do
    it "returns http success" do
      get 'register'
      response.should be_success
    end
  end

end
