# Description:
#   Hubot listens!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Wylie

module.exports = (robot) ->

  robot.hear /\b(some\sthing)\b/i, (res) ->
    username = res.message.user.name
    res.send "You are `#{username}`!"

  robot.listen(
    (message) -> # Match function
      # Occassionally respond to things that Wylie says
      message.user.name is "wyliefisher" and Math.random() <= 1
    (response) -> # Standard listener callback
      # Let Wylie know how happy you are that he exists
      sender = res.message.user.name.toLowerCase()
      response.reply "YOU'RE MY BEST FRIEND!"
  )
