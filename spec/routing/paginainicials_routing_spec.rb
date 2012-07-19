require "spec_helper"

describe PaginainicialsController do
  describe "routing" do

    it "routes to #index" do
      get("/paginainicials").should route_to("paginainicials#index")
    end

    it "routes to #new" do
      get("/paginainicials/new").should route_to("paginainicials#new")
    end

    it "routes to #show" do
      get("/paginainicials/1").should route_to("paginainicials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/paginainicials/1/edit").should route_to("paginainicials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/paginainicials").should route_to("paginainicials#create")
    end

    it "routes to #update" do
      put("/paginainicials/1").should route_to("paginainicials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/paginainicials/1").should route_to("paginainicials#destroy", :id => "1")
    end

  end
end
