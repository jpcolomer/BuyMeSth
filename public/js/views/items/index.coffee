class BuyMeSth.Views.ItemsIndex extends Backbone.View
  tagName: 'ul'
  className: 'list-unstyled'
  template: _.template($('#items_template').html())

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendItem, this)

  render: ->
    @$el.html(@template())
    @collection.each(@appendItem)
    this

  appendItem: (item) =>
    itemView = new BuyMeSth.Views.ItemView(model: item)
    @$el.append itemView.render().el

