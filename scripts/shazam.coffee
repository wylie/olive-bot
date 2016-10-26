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
#   hubot post in '<message>' -- Hubot will post your message in another room
#
# Author:
#   Wylie

module.exports = (robot) ->

  # shazam
  robot.hear /(timmy) (.*) (.*)/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    one = res.match[1].trim()
    two = res.match[2].trim()
    three = res.match[3].trim()
    message = res.message
    room = res.message.room
    if two == "shazam"
      res.send "#{two}!\nHey, @#{sender}\nYou posted the following in ##{room}\n> #{message}"
    if two == "shazbot"
      res.send "#{two}!\nHey, @#{sender}\n> #{message}\nThats what you posted in ##{room}"

  # shazam
  robot.hear /post\sin\s(.*)\s('.*')/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    postTo = res.match[1].trim()
    message = res.match[2].trim()
    room = res.message.room
    robot.send room: "#{postTo}", "@#{sender} just posted this in ##{room}\n> #{message}"
