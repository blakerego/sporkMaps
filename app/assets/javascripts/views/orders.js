/**********************************
Order View 
**********************************/
var OrderView = Backbone.View.extend({
  tagName: 'tr', // name of (orphan) root tag in this.el. 
  initialize: function() 
  {
    _.bindAll(this); 
    /*
    this.model.bind('change', this.render); 
    this.model.bind('remove', this.unrender); 
    */
  },

  render: function() 
  {

    //$(this.el).html('<td>' + this.model.get('item').get('name') + '</td><td> '  + this.model.get('item').get('price')+ '</td><td>' + this.model.get('quantity') + '</td><td class="btn delete">x</td>');

    return this; // for chainable calls, like .render().el
  },

  unrender: function() 
  {
    $(this.el).remove();
  },

  remove: function() 
  {
    this.model.destroy(); 
    this.unrender(); //This should not be necessary if the model binding to unrender works properly.
  }
});

/**********************************
Current Order View 
**********************************/
var CurrentOrderView = Backbone.View.extend({

  el: $('#order_area'), // attaches `this.el` to an existing element.
  
  initialize: function() 
  {
    this.el = $('#order_area');
    _.bindAll(this); 

    this.model = new CurrentOrder();
    this.model.fetch();

    this.model.bind('change', this.render); 
    this.model.bind('remove', this.unrender); 

    //this.model.bind(this.render, this.orderItems.render); 

  },

  render: function()
  {
    $(this.el).append("<h3>Order Summary</h3>"); 
    $(this.el).append("<div id='orderItemTable'></div>");
    
    $(this.el).append("<b>Order Total: $" + this.model.get('total') + "</b>");
    this.orderItems = new OrderItemListView();

    //this.orderItems.render(); 
    // _(this.orderItems.collection.models).each(function(item){
    //   self.appendItem(item);
    // }, this);
  }
});