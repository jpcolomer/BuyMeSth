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
  response.render("index")

#socket.io
io.sockets.on 'connection', (socket) ->
  console.log 'Client connected ...'
  socket.on "addItem", storeItem
  socket.on "items:create", (item) ->
    storeItem(item, ->
      socket.broadcast.emit("addItem", item)
    )
  socket.on "join", ->
    console.log 'joined'
    redisClient.lrange "items", 0, -1, (err, items) ->
      items = items.reverse()
      for item in items
        item = JSON.parse(item)
        socket.emit("addItem", item)

storeItem = (data, callback) ->
  item = JSON.stringify(data)
  redisClient.lpush("items", item, callback)

server.listen(4000)

