module.exports = (robot) ->
  speaks = ['Woof', 'Bark', 'Grrr']
  robot.respond /speak/i, (res) ->
    res.send res.random speaks

  robot.topic (res) ->
    res.send "Are you sure you want change the channel topic to #{res.message.text}?"

  robot.respond /would you like a biscuit/i, (res) ->
    res.send "yes, please!"

  # room = req.params.room
  # enterReplies = ['Hi', 'Welcome!', 'Hello friend', 'I see you', "We're happy to have you her in #{room}"]
  enterReplies = ['Hi', 'Welcome!', 'Hello friend', 'I see you', "We're happy to have you here"]
  robot.respond /welcome/i, (res) ->
  # robot.enter (res) ->
    res.send res.random enterReplies ", I'm Olive and I'm here to help you out with things"

  robot.respond /hey/i, (res) ->
    setTimeout () ->
      res.send '...huh?', 60 * 100000
