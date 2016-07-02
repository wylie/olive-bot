module.exports = (robot) ->
  speaks = ['Woof', 'Bark', 'Grrr']
  robot.respond /speak/i, (res) ->
    res.send res.random speaks

  robot.topic (res) ->
    res.send "Are you sure you want change the channel topic to #{res.message.text}?"

  robot.respond /would you like a biscuit/i, (res) ->
    res.send "yes, please!"

  robot.hear /walk/i, (res) ->
    res.send "Did somebody say walk?!"

  enterReplies = ["Hi", "Welcome", "Hello friend", "Boy, am I glad you\re here", "We're happy to have you"]
  # robot.respond /welcome/i, (res) ->
  robot.enter (res) ->
    randomReply = res.random enterReplies
    res.send "#{randomReply}, I'm Olive and I'm here to help you out with things. You can type `Olive help` to see all the things I can lend a hand with."

  robot.respond /hey/i, (res) ->
    setTimeout () ->
      res.send '...huh?', 60 * 100000
