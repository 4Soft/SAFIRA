# -*- encoding : utf-8 -*-
require "spec_helper"

describe EntrepreneursController do
  describe "routing" do

    it "routes to #index" do
      get("/entrepreneurs").should route_to("entrepreneurs#index")
    end

    it "routes to #new" do
      get("/entrepreneurs/new").should route_to("entrepreneurs#new")
    end

    it "routes to #show" do
      get("/entrepreneurs/1").should route_to("entrepreneurs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/entrepreneurs/1/edit").should route_to("entrepreneurs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/entrepreneurs").should route_to("entrepreneurs#create")
    end

    it "routes to #update" do
      put("/entrepreneurs/1").should route_to("entrepreneurs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/entrepreneurs/1").should route_to("entrepreneurs#destroy", :id => "1")
    end

  end
end
