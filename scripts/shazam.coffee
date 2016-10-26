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

  # post in abother room
  robot.hear /post\sin\s(.*)\s'(.*)'/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    postTo = res.match[1].trim()
    message = res.match[2].trim()
    room = res.message.room
    robot.send room: "#{postTo}", "@#{sender} just posted this in ##{room}\n> #{message}"

  # post in abother room
  # robot.hear /(.*)\salert\s(.*)/i, (res) ->
  #   room = res.message.room
  #   sender = res.message.user.name.toLowerCase()
  #   message = res.match[1].trim()
  #   postTo = res.match[2].trim()
  #   robot.send room: "#{postTo}", "@#{sender} just posted this in ##{room}\n> #{message}"

  # post previous post in abother room
  # robot.hear /(.*)\salert\s(.*)/i, (res) ->
  robot.hear /alert/i, (res) ->
    queryData =  {
      token: process.env.HUBOT_SLACK_TOKEN
      name: "cat"
      channel: res.message.rawMessage.channel # required with timestamp, uses rawMessage to find this
      timestamp: res.message.id # this id is no longer undefined
    }
    if (queryData.timestamp?)
        .post() (err, res, body) ->
          # robot.send "id: #{id}\nidPrev: #{timestamp}"
          return
