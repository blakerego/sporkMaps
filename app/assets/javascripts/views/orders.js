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