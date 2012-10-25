require 'spec_helper'

describe "food_trucks/show" do
  before(:each) do
    @food_truck = assign(:food_truck, stub_model(FoodTruck,
      :truck_name => "Truck Name",
      :first_name => "First Name",
      :last_name => "Last Name",
      :phone => "Phone",
      :cuisine_type => "Cuisine Type",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
      :address => "Address",
      :number_of_trucks => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Truck Name/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Phone/)
    rendered.should match(/Cuisine Type/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zipcode/)
    rendered.should match(/Address/)
    rendered.should match(//)
  end
end
