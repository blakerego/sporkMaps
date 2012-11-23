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
        $(this.el).html('<td>' + this.model.get('item').get('name') + '</td><td> '  + this.model.get('item').get('price')+ '</td><td>' + this.model.get('quantity') + '</td><td class="btn delete"> [x]</td>');

        return this; // for chainable calls, like .render().el
      },

      unrender: function() 
      {
        alert('unrender');
        $(this.el).remove();
      },

      remove: function() 
      {
        alert('removing');
        alert(this.model.get('id'));
        this.model.destroy(); 
      }

    });

    /**********************************
    List View
    **********************************/
    var OrderItemListView = Backbone.View.extend({    

      el: $('#app'), // attaches `this.el` to an existing element.


      events: {
        //'click button#add': 'addOrderItem'
      },

      initialize: function(){

        this.el = $('#app'); //this shouldn't be

        _.bindAll(this, 'render', 'addOrderItem', 'appendOrderItem'); 
         
        this.collection = new List();
        this.collection.bind('add', this.appendOrderItem); //whenever add is called on the list, append is called to update view. 

         this.counter = 0; 
         this.render(); // not all views are self-rendering. This one is.
      },
      // `render()`: Function in charge of rendering the entire view in `this.el`. Needs to be manually called by the user.
      render: function(){
        //$(this.el).append("<button id='add'>Add list order item</button>");
        $(this.el).append("<table id='order_table' class='table table-condensed'><tr><th>Item</th><th>Price</th><th>Quantity</th></tr><tbody id='orderItemTable'>");
        $(this.el).append("</tbody></table>");
        _(this.collection.models).each(function(item){
          self.appendItem(item);
        }, this);
      },

      addOrderItem: function() { 
        var orderitem = new OrderItem(); 
        orderitem.save(); 
        this.collection.add(orderitem); // add item to collection. view is updated because of the binding of 'add' in initialize.
        },

      appendOrderItem: function(orderItem) {
        var orderItemView = new OrderItemView({
          model: orderItem
        });
        $('#orderItemTable', this.el).append(orderItemView.render().el);
        }
      });
