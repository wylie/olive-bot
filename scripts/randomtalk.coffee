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
  #   send "Hey, want to hear the most annoying sound in the world?"
  #     res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000

  robot.respond /i/i, (res) ->
    setInterval () ->
      res.send "Hey, want to hear the most annoying sound in the world?"
    , 60 * 1000
  )
