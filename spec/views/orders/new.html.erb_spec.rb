require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :food_truck_id => 1,
      :total => "9.99",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_food_truck_id", :name => "order[food_truck_id]"
      assert_select "input#order_total", :name => "order[total]"
      assert_select "input#order_status", :name => "order[status]"
    end
  end
end
