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
    sender = res.message.user.name.toLowerCase()
    one = msg.match[1].trim()
    two = msg.match[2].trim()
    message = res.message
    room = res.message.room
    res.send "@#{sender}\n> #{one}, #{two}`\n wrote in room: ##{room}\n> #{message} "
