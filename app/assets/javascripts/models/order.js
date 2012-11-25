/**********************************
MODEL for orders
**********************************/
var Order = Backbone.Model.extend({
  urlRoot : "/orders", 
});


/**********************************
MODEL for current order
**********************************/
var CurrentOrder = Backbone.Model.extend({
  urlRoot : "/currentOrder", 

	parse: function(response) 
	{
			//alert(Object.keys(response.order_items[0]));
	    return response;
	}

});
