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
  robot.hear /\b(shazam) (.*)\b/i, (res) ->
    one = msg.match[1].trim()
    two = msg.match[2].trim()
    sender = res.message.user.name.toLowerCase()
    message = res.message
    room = res.message.room
    # email = res.message.text
    # usrs = users.length
    res.send "@#{sender}, who has the email address `#{one}` and `#{two}`, wrote this in ##{room}\n> #{message} "
