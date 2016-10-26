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
    # sender = res.message.user.name.toLowerCase()
    sender = res.message.id
    res.send "SHAZAM, @#{sender}!"
