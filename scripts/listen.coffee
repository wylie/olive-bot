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

  robot.listen(
    (message) -> # Match function
      # Occassionally respond to things that Rob says
      message.user.name is "roberto" and Math.random() > 0.8
    (response) -> # Standard listener callback
      # Let Rob know how happy you are that he exists
      sender = res.message.user.name.toLowerCase()
      response.reply "HI @#{sender}! YOU'RE MY BEST FRIEND!"
  )
  robot.listen(
    (message) -> # Match function
      # Occassionally respond to things that Wylie says
      message.user.name is "wyliefisher" and Math.random() > 0.9999
    (response) -> # Standard listener callback
      # Let Wylie know how happy you are that he exists
      sender = res.message.user.name.toLowerCase()
      response.reply "HI @#{sender}! YOU'RE MY BEST FRIEND!"
  )
