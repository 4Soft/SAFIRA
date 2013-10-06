require "spec_helper"

describe PresencesController do
  describe "routing" do

    it "routes to #index" do
      get("/presences").should route_to("presences#index")
    end

    it "routes to #new" do
      get("/presences/new").should route_to("presences#new")
    end

    it "routes to #show" do
      get("/presences/1").should route_to("presences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/presences/1/edit").should route_to("presences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/presences").should route_to("presences#create")
    end

    it "routes to #update" do
      put("/presences/1").should route_to("presences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/presences/1").should route_to("presences#destroy", :id => "1")
    end

  end
end
