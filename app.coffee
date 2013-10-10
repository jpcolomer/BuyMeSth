express =  require('express')
http = require('http')
redis = require('redis')

app = express()

server = http.createServer(app)
io = require('socket.io').listen(server)

#instantiate redis
redisClient = redis.createClient()

# Define view engine and directory
app.set "view engine", "jade"
app.set "views", __dirname + "/views"

app.use(express.static('public'))

# routes

app.get "/", (request, response)  ->
  renderAndBootstrapData(response)

app.get "/comprador", (request, response)  ->
  renderAndBootstrapData(response)

#socket.io
io.sockets.on 'connection', (socket) ->
  console.log 'Client connected ...'

  #use instead of REST API for Backbone
  socket.on "items:create", (item) ->
    storeItem(item, ->
      socket.broadcast.emit("addItem", item)
    )

storeItem = (data, callback) ->
  item = JSON.stringify(data)
  redisClient.lpush("items", item, callback)

renderAndBootstrapData = (res) ->
  redisClient.lrange "items", 0, -1, (err, items) ->
    items.reverse()
    items = JSON.stringify(items)
    res.render("index", data: items)

io.configure 'production', ->
  console.log 'Server in production mode'
  io.enable('browser client minification')
  io.enable('browser client etag')
  io.enable('browser client gzip')
  io.set('log level', 1)
  io.set('transports', [
    'websocket'
    'flashsocket'
    'htmlfile'
    'xhr-polling'
    'jsonp-polling'
  ])

server.listen(8080)

