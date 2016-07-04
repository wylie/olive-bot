# Description:
#   Pugme is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pug me - Receive a pug
#   hubot pug bomb N - get N pugs

module.exports = (robot) ->

  # robot.respond /speak/i, (res) ->
  #   res.send "Hey, want to hear the most annoying sound in the world?"
    # send "Hey, want to hear the most annoying sound in the world?"
    # setInterval () ->
    #   res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
    # , 1000

  robot.listen(
    (message) -> # Match function
      # Occassionally respond to things that Wylie says
      message.user.name is "Wylie" and Math.random() > 0.8
    (response) -> # Standard listener callback
      # Let Wylie know how happy you are that he exists
      response.reply "HI Wylie! YOU'RE MY BEST FRIEND! (but only like #{response.match * 100}% of the time)"
  )
