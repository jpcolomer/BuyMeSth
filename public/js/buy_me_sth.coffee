window.BuyMeSth = 
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BuyMeSth.Routers.Items()
    Backbone.history.start()
  sync: (method, model, options) ->
    socket = BuyMeSth.socket
    switch method
      when 'create'
        socket.emit 'items:create', model
      when 'update'
        console.log('update')
      when 'delete'
        console.log('update')    
      when 'read'
        console.log('read')


$(document).ready ->
  BuyMeSth.socket = io.connect('http://localhost:8080')
  BuyMeSth.socket.on 'connect', ->
    @emit 'join'
  BuyMeSth.socket.on 'messages', (data) ->
    console.log data.hello
  BuyMeSth.socket.on 'addItem', (item) ->
    BuyMeSth.collection.push item
  BuyMeSth.initialize()