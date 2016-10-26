# Description:
#   Hubot hears something...
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

  # shazam
  robot.hear /\bshazam\b/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    message = res.message
    room = res.message.room
    res.send "@#{sender} wrote this in #{room}\n> #{sender} "
