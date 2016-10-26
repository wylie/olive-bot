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
  robot.hear /(timmy) (.*) (.*)/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    one = res.match[1].trim()
    two = res.match[3].trim()
    three = res.match[3].trim()
    message = res.message
    room = res.message.room
    if two == "shazam"
      res.send "#{two}!\nHey, @#{sender}\nYou posted the following in ##{room}\n> #{message}"
    else
      res.send "#{two}!\nHey, @#{sender}\n> #{message}\nThats what you posted in ##{room}"

  # shazam
  # robot.hear /(timmy) shazbot (.*)/i, (res) ->
  #   sender = res.message.user.name.toLowerCase()
  #   one = res.match[1].trim()
  #   two = res.match[3].trim()
  #   message = res.message
  #   room = res.message.room
  #   res.emote "@#{sender}\n> #{one}, #{two}\n wrote in room: ##{room}\n> #{message} "
