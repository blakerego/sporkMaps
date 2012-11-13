require 'spec_helper'

describe "food_trucks/index" do
  before(:each) do
    assign(:food_trucks, [
      stub_model(FoodTruck,
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
      ),
      stub_model(FoodTruck,
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
      )
    ])
  end

  it "renders a list of food_trucks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Truck Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Cuisine Type".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
