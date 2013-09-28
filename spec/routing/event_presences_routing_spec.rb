require "spec_helper"

describe EventPresencesController do
  describe "routing" do

    it "routes to #index" do
      get("/event_presences").should route_to("event_presences#index")
    end

    it "routes to #new" do
      get("/event_presences/new").should route_to("event_presences#new")
    end

    it "routes to #show" do
      get("/event_presences/1").should route_to("event_presences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_presences/1/edit").should route_to("event_presences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_presences").should route_to("event_presences#create")
    end

    it "routes to #update" do
      put("/event_presences/1").should route_to("event_presences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_presences/1").should route_to("event_presences#destroy", :id => "1")
    end

  end
end
