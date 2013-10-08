class BuyMeSth.Views.App extends Backbone.View
  className: 'container' 

  initialize: ->
    @subviews = [
      new BuyMeSth.Views.NewItem(collection: @collection)
      new BuyMeSth.Views.ItemsIndex(collection: @collection)
    ]

  render: ->
    @$el.append(subview.render().el) for subview in @subviews
    this