
var OrderItem = Backbone.Model.extend({
	url : function() {
		var base = 'order_items'; 
		if (this.isNew()) return base;
		return base + (base.charAt(base.length-1) == '/' ? '' : '/') + this.id; 
	}
});