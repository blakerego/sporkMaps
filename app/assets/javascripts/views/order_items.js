/**********************************
Item View 
**********************************/
var OrderItemView = Backbone.View.extend({
  tagName: 'tr', // name of (orphan) root tag in this.el. 
  initialize: function() 
  {
    _.bindAll(this, 'render', 'unrender', 'remove'); 
    this.model.bind('change', this.render); 
    this.model.bind('remove', this.unrender); 
  },

  events: {
    'click td.delete': 'remove'
  },

  render: function() 
  {
    $(this.el).html('<td>' + this.model.get('item').get('name') + '</td><td> '  + this.model.get('item').get('price')+ '</td><td>' + this.model.get('quantity') + '</td><td class="btn delete">x</td>');

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
List View
**********************************/
var OrderItemListView = Backbone.View.extend({    

  el: $('#orderItemTable'), // attaches `this.el` to an existing element.

  initialize: function()
  {
    this.el = $('#orderItemTable'); //this shouldn't be necessary.
     _.bindAll(this); 
    this.collection = new OrderItemList();  
    this.collection.url =  '/currentOrderItems';
    this.collection.fetch( { success: this.addCurrentOrder } ); 
    this.render(); // not all views are self-rendering. This one is.
  },

  addCurrentOrder: function(model, response)
  {
    _(response).each(function(d)
    {
      var oi = new OrderItem(d); 
      this.appendOrderItem(oi);
    }, this);

  },

  render: function()
  {
    $(this.el).append("<table id='order_table' class='table table-condensed'><tr><th>Item</th><th>Price</th><th>Quantity</th></tr><tbody id='orderItemTable'>");
    $(this.el).append("</tbody></table>");
    _(this.collection.models).each(function(item){
      self.appendItem(item);
    }, this);
  },

  appendOrderItem: function(orderItem) 
  {
    var orderItemView = new OrderItemView({
      model: orderItem
    });
    $('#orderItemTable', this.el).append(orderItemView.render().el);
  }

});
