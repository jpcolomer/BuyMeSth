class BuyMeSth.Views.BuyerView extends Backbone.View

  initialize: ->
    @subviews = [
      new BuyMeSth.Views.ItemsIndex(collection: @collection)
    ] 

  render: ->
    @$el.append(subview.render().el) for subview in @subviews
    this
