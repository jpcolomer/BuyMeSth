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
  server = io.connect('http://localhost:4000')
  server.on 'messages', (data) ->
    console.log data.hello
