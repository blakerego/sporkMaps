require 'spec_helper'

describe "food_trucks/edit" do
  before(:each) do
    @food_truck = assign(:food_truck, stub_model(FoodTruck,
      :truck_name => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :cuisine_type => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :address => "MyString",
      :number_of_trucks => ""
    ))
  end

  it "renders the edit food_truck form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => food_trucks_path(@food_truck), :method => "post" do
      assert_select "input#food_truck_truck_name", :name => "food_truck[truck_name]"
      assert_select "input#food_truck_first_name", :name => "food_truck[first_name]"
      assert_select "input#food_truck_last_name", :name => "food_truck[last_name]"
      assert_select "input#food_truck_phone", :name => "food_truck[phone]"
      assert_select "input#food_truck_cuisine_type", :name => "food_truck[cuisine_type]"
      assert_select "input#food_truck_city", :name => "food_truck[city]"
      assert_select "input#food_truck_state", :name => "food_truck[state]"
      assert_select "input#food_truck_zipcode", :name => "food_truck[zipcode]"
      assert_select "input#food_truck_address", :name => "food_truck[address]"
      assert_select "input#food_truck_number_of_trucks", :name => "food_truck[number_of_trucks]"
    end
  end
end
