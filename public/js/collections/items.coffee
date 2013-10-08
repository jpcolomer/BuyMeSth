class BuyMeSth.Collections.Items extends Backbone.Collection
  model: BuyMeSth.Models.Item
  sync: BuyMeSth.sync
  # initialize: ->
  #   @on 'create', @addOnServer, this

  # addOnServer: (item) ->
  #   BuyMeSth.socket.emit "addItem", item