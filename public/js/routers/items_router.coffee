class BuyMeSth.Routers.Items extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new BuyMeSth.Collections.Items()
    BuyMeSth.collection = @collection

  index: ->
    view = new BuyMeSth.Views.App(collection: @collection)
    $('body').prepend(view.render().el)