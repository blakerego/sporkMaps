App.Views.Index = Backbone.View.extend({
	initialize: function() {
		this.order_items = this.options.order_items; 
		this.render();
	}, 

	render: function() {
		if(this.order_items.length > 0)
		{
			var out = "<h3><a href='#new'>Create New</a></h3><ul>";
			_(this.order_items).each(function(item){
				out += "<li><a href='#order_items/" + item.id + "'>" + item.escape('title') + "</a></li>";
			});
			out += "</ul>"
		}
		else 
		{
			out = "<h3>No order items <a href='#new'>Create one</a></h3>";
		}
		$(this.el).html(out); 
		$('#app').html(this.el);
	}
});