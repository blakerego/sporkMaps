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

  el: $('#app'), // attaches `this.el` to an existing element.

  initialize: function()
  {
    this.el = $('#app'); //this shouldn't be

    //_.bindAll(this, 'render', 'appendOrderItem', 'addCurrentOrder'); 
    
     _.bindAll(this); //this should bind all methods to this context.
    

    this.collection = new OrderItemList();  
    //this.OrderItems = new Backbone.Collection;
    this.collection.url =  '/currentOrderItems';
    this.collection.fetch( { success: this.addCurrentOrder } ); 

    //this.collection.bind('add', this.appendOrderItem); //whenever add is called on the list, append is called to update view. 
    this.render(); // not all views are self-rendering. This one is.


    //alert(_(this.))

    //this.collection.bind('add', this.appendOrderItem); //whenever add is called on the list, append is called to update view. 

    //$.ajax( { type: 'Get', url: '/currentOrder', dataType: 'json', success: this.loadCurrentOrder });

  },

  addCurrentOrder: function(data)
  {
    alert(_.size(data));
    
    /*_(data).each((function(d)
    {
      var oi = new OrderItem(d); 
      this.appendOrderItem(oi);
    });*/
  },

  render: function()
  {
    //$(this.el).append("<button id='add'>Add list order item</button>");
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
