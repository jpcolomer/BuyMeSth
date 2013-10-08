class BuyMeSth.Views.ItemsIndex extends Backbone.View
  tagName: 'ul'
  className: 'list-unstyled'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendItem, this)

  render: ->
    @collection.each(@appendItem)
    this

  appendItem: (item) =>
    itemView = new BuyMeSth.Views.ItemView(model: item)
    @$el.append itemView.render().el

