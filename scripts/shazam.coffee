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
#   <message> alert <channel> -- Hubot will post your message in another room
#
# Author:
#   Wylie

module.exports = (robot) ->

  # post in abother room
  robot.hear /(.*)\salert\s(.*)/i, (res) ->
    room = res.message.room
    sender = res.message.user.name.toLowerCase()
    message = res.match[1].trim()
    postTo = res.match[2].trim()
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN)
      .get() (error, response, body) ->
        json = JSON.parse(body)
        i = 0
        while i < json.channels.length
          if json.channels[i].name == postTo
          # res.send json.channels[i].name
            robot.send room: "#{postTo}", "> #{message}\n@#{sender} just posted this in ##{json.channels[i].name}"
          i++

  # get channel id
  robot.hear /chan/i, (res) ->
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN)
      .get() (error, response, body) ->
        # res.send response
        # res.send body
        res.send JSON.parse(body)
        # response = JSON.parse(body)
      	# res.send "It worked!"

  # get channel id
  robot.hear /blimp/i, (res) ->
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN)
      .get() (error, response, body) ->
        json = JSON.parse(body)
        i = 0
        while i < json.channels.length
          res.send json.channels[i].name
          i++
