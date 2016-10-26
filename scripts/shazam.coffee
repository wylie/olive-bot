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
    robot.send room: "#{postTo}", "> #{message}\n@#{sender} just posted this in ##{room}"

  # get channel id
  robot.hear /chan/i, (res) ->
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN)
      .get() (err, res, body) ->
        response = JSON.parse(body)
        res.send response
        # if response.success == "true"
        # 	res.send "It worked!"
        # else
        #   res.send "It did not work!"
