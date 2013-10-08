express =  require('express')
http = require('http')
app = express()

server = http.createServer(app)
io = require('socket.io').listen(server)


app.set "view engine", "jade"
app.set "views", __dirname + "/views"
app.use(express.static('public'))

app.get "/", (request, response)  ->
  response.render("index")

io.sockets.on 'connection', (socket) ->
  console.log 'Client connected ...'
  socket.on "addItem", (item) ->
    socket.broadcast.emit("addItem", item)

server.listen(4000)

