# Description:
#   The base file in Hubot

module.exports = (robot) ->
  robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
    room   = req.params.room
    data   = JSON.parse req.body.payload
    secret = data.secret

    robot.messageRoom room, "I have a secret: #{secret}"

    res.send 'OK'
