window.BuyMeSth = 
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BuyMeSth.Routers.Items()
    Backbone.history.start()

$(document).ready ->
  BuyMeSth.initialize()
  BuyMeSth.socket = io.connect('http://localhost:4000')
  BuyMeSth.socket.on 'messages', (data) ->
    console.log data.hello
  BuyMeSth.socket.on 'addItem', (item) ->
    BuyMeSth.collection.push item