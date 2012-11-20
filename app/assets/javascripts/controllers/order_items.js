
App.Routers.OrderItems = Backbone.Router.extend({
	routes: {
		"order_items/:id": 		"edit",
		"": 									"index",
		"new": 								"newOrderItem"
	},

	edit: function(id){
		var order_item = new OrderItem({id: id});
		order_item.fetch({
			success: function(model, resp)
			{
				new App.Views.Edit({ model: order_item});
			},
			error: function()
			{
				new Error({ message: 'Could not find that order_item'});
			}
		});
	},

	index: function() {
		$.getJSON('/order_items', function(data){
			if(data){
				var order_items = _(data).map(function(i) {return new OrderItem(i); });
				new App.Views.Index({ order_items: order_items});
			}
			else 
			{
				new Error({message: "Error loading order_items."});
			}
		});
	},

	newOrderItem: function() {
		new App.Views.Edit({ model: new OrderItem()});
	}
}
);