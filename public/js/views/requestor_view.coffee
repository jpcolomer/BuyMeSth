class BuyMeSth.Views.RequestorView extends Backbone.View

  initialize: ->
    @subviews = [
      new BuyMeSth.Views.NewItem(collection: @collection)
    ] 

  render: ->
    @$el.append(subview.render().el) for subview in @subviews
    this
