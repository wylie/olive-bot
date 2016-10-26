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
    email = res.message.email_address
    res.send "@#{sender}, who has the email address #{email}, wrote this in ##{room}\n> #{message} "
