class BuyMeSth.Views.App extends Backbone.View 

  initialize: ->
    @subviews = [
      new BuyMeSth.Views.MenuView(collection: @collection)
    ]

  render: ->
    @$el.append(subview.render().el) for subview in @subviews
    this