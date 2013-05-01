require "spec_helper"

describe ProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/projects").should route_to("projects#index")
    end

    it "routes to #new" do
      get("/projects/new").should route_to("projects#new")
    end

    it "routes to #create" do
      post("/projects").should route_to("projects#create")
    end

    it "routes to #destroy" do
      delete("/projects/1").should route_to("projects#destroy", :id => "1")
    end

  end
end
