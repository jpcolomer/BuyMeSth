class BuyMeSth.Collections.Items extends Backbone.Collection
  model: BuyMeSth.Models.Item

  initialize: ->
    @on 'create', @addOnServer, this

  addOnServer: (item) ->
    BuyMeSth.socket.emit "addItem", item