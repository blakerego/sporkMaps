require "spec_helper"

describe FoodTrucksController do
  describe "routing" do

    it "routes to #index" do
      get("/food_trucks").should route_to("food_trucks#index")
    end

    it "routes to #new" do
      get("/food_trucks/new").should route_to("food_trucks#new")
    end

    it "routes to #show" do
      get("/food_trucks/1").should route_to("food_trucks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/food_trucks/1/edit").should route_to("food_trucks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/food_trucks").should route_to("food_trucks#create")
    end

    it "routes to #update" do
      put("/food_trucks/1").should route_to("food_trucks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/food_trucks/1").should route_to("food_trucks#destroy", :id => "1")
    end

  end
end
