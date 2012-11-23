/**********************************
MODEL 
**********************************/
var OrderItem = Backbone.Model.extend({
  urlRoot : "/order_items", 

  initialize: function() {
    this.set({ 'item' : new Item(this.get('item')) })
	}
});


/**********************************
Collection
**********************************/
var OrderItemList = Backbone.Collection.extend({
  model: OrderItem,
  url: '/currentOrderItems'
});

