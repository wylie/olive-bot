module.exports = (robot) ->
  # channel topic change
  robot.topic (res) ->
    res.send "Are you sure you want change the channel topic to #{res.message.text}?"

  # biscuit
  robot.respond /would you like a biscuit/i, (res) ->
    res.send "yes, please!"

  # walks
  robot.hear /walk/i, (res) ->
    res.send "Did somebody say walk?!"

  # enter room welcome
  enterReplies = ["Hi", "Welcome", "Hello friend", "Boy, am I glad you\re here", "We're happy to have you"]
  robot.enter (res) ->
    randomReply = res.random enterReplies
    res.send "#{randomReply}, I'm Olive and I'm here to help you out with things. You can type `Olive help` to see all the things I can lend a hand with."

  robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
    room   = req.params.room
    data   = JSON.parse req.body.payload
    secret = data.secret

    robot.messageRoom room, "I have a secret: #{secret}"

    res.send 'OK'
