class BuyMeSth.Views.NewItem extends Backbone.View
  className: 'new_item'
  template: _.template($('#new_item_template').html())
  events:
    'submit form': 'createItem'

  render: ->
    @$el.html(@template())
    this

  createItem: (event) ->
    event.preventDefault()
    attributes = 
      name : $('#new_item_person').val()
      product : $('#new_item_product').val()
    @collection.push attributes
    @collection.trigger('create', attributes)
    $('form')[0].reset()