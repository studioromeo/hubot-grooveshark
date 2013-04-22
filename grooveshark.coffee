# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot play
#   hubot pause
#   hubot next
#   hubot prev


# Socket.io
io = require("socket.io").listen(1337)

# We only need 1 active connection
io.sockets.on "connection", (socket) ->
	io = socket

module.exports = (robot) ->
  robot.router.get "/grooveshark/", (req, res) ->
    fs = require("fs")
    fs.readFile __dirname + "/grooveshark/script.js", (err, data) ->
      res.writeHead 200
      res.end data

  robot.respond /play$/i, (msg) ->
    io.emit "com", "Grooveshark.play()"
    msg.send "Okay, I'll play this one for you"

  robot.respond /pause$/i, (msg) ->
    io.emit "com", "Grooveshark.pause()"
    msg.send "Dude, where did the tunes go?"

  robot.respond /next$/i, (msg) ->
    io.emit "com", "Grooveshark.next()"
    msg.send "I wasn't much of a fan either!"

  robot.respond /prev$/i, (msg) ->
    io.emit "com", "Grooveshark.previous()"
    msg.send "Really? Again...really?"


