class OrderItemsController < ApplicationController
  require 'sessions_helper'
  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_items }
    end
  end

  def currentOrderItems
    puts '************************ in currentOrderItems' + current_order.order_items.size.to_s

    respond_to do |format|
      format.json { render json: current_order.order_items.to_json(:include => [:item]) }
    end
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/new
  # GET /order_items/new.json
  def new
    @order_item = OrderItem.new



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/1/edit
  def edit
    @order_item = OrderItem.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.new(params[:order_item])

    if has_order?
      puts 'has order'
      puts current_order
    else
      puts 'no order, creating'
      cache_new_order Order.create(:food_truck_id => params['food_truck_id'], :status => 'incomplete')
      puts 'order cached'
    end

    @order_item.order_id = current_order.id

    respond_to do |format|
      if @order_item.save
        current_order.calculateOrderTotal
        format.html { redirect_to @order_item, notice: 'Order item was successfully created.' }
        format.json { render json: @order_item.to_json(:include => [:item]), status: :created, location: @order_item }
      else
        format.html { render action: "new" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_items/1
  # PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if @order_item.update_attributes(params[:order_item])
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    puts 'in destroy method'
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_items_url }
      format.json { head :no_content }
      format.js { render :layout=>false }
    end
  end
end
