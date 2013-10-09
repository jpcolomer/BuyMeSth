class BuyMeSth.Routers.Items extends Backbone.Router
  routes:
    '': 'index'
    'comprador': 'buyer'

  initialize: ->
    @collection = new BuyMeSth.Collections.Items()
    BuyMeSth.collection = @collection

  index: ->
    @removeSubView()
    @subView = new BuyMeSth.Views.RequestorView(collection: @collection)
    $('.container').append(@subView.render().el)

  buyer: ->
    @removeSubView()
    @subView.remove() if @subView
    @subView = new BuyMeSth.Views.BuyerView(collection: @collection)
    $('.container').append(@subView.render().el)

  removeSubView: ->
    if @subView
      @subView.remove()
    else
      appView = new BuyMeSth.Views.App(collection: @collection)
      $('.container').html(appView.render().el)