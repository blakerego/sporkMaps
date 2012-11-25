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
});
