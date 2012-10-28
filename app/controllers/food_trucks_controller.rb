class FoodTrucksController < ApplicationController
  # GET /food_trucks
  # GET /food_trucks.json
  def index
    @food_trucks = FoodTruck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_trucks }
    end
  end

  # GET /food_trucks/1
  # GET /food_trucks/1.json
  def show
    @food_truck = FoodTruck.find(params[:id])
    @menuItems = Item.find(:all, :conditions => { :food_truck_id => @food_truck.id });

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_truck }
    end
  end

  # GET /food_trucks/new
  # GET /food_trucks/new.json
  def new
    @food_truck = FoodTruck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_truck }
    end
  end

  # GET /food_trucks/1/edit
  def edit
    @food_truck = FoodTruck.find(params[:id])
    @menuItems = Item.find(:all, :conditions => { :food_truck_id => @food_truck.id });
    @item = Item.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }  
    end  
  end

  # POST /food_trucks
  # POST /food_trucks.json
  def create
    @food_truck = FoodTruck.new(params[:food_truck])

    respond_to do |format|
      if @food_truck.save
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully created.' }
        format.json { render json: @food_truck, status: :created, location: @food_truck }
      else
        format.html { render action: "new" }
        format.json { render json: @food_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_trucks/1
  # PUT /food_trucks/1.json
  def update
    @food_truck = FoodTruck.find(params[:id])

    respond_to do |format|
      if @food_truck.update_attributes(params[:food_truck])
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_trucks/1
  # DELETE /food_trucks/1.json
  def destroy
    @food_truck = FoodTruck.find(params[:id])
    @food_truck.destroy

    respond_to do |format|
      format.html { redirect_to food_trucks_url }
      format.json { head :no_content }
    end
  end
end
