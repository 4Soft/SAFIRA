require "spec_helper"

describe CashiersController do
  describe "routing" do

    it "routes to #index" do
      get("/cashiers").should route_to("cashiers#index")
    end

    it "routes to #new" do
      get("/cashiers/new").should route_to("cashiers#new")
    end

    it "routes to #show" do
      get("/cashiers/1").should route_to("cashiers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cashiers/1/edit").should route_to("cashiers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cashiers").should route_to("cashiers#create")
    end

    it "routes to #update" do
      put("/cashiers/1").should route_to("cashiers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cashiers/1").should route_to("cashiers#destroy", :id => "1")
    end

  end
end
