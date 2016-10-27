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

  # post in another room
  robot.hear /(.*)\salert\s(.*)/i, (res) ->
    postFrom = res.message.room # get the current room
    sender = res.message.user.name.toLowerCase() # get the posters username
    message = res.match[1].trim() # get the message
    postTo = res.match[2].trim() # get the room to post to
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN) # get the JSON
      .get() (error, response, body) ->
        json = JSON.parse(body) # parse the JSON
        i = 0
        while i < json.channels.length # loop through each channel
          if json.channels[i].name == postFrom # if the channel matches grab the channel ID so we can make a link
            robot.send room: "#{postTo}", "> #{message}\n@#{sender} just posted this in <##{json.channels[i].id}|#{json.channels[i].name}>" # post to the desired channel
          i++

  # post in multiple other rooms
  robot.hear /(.*)\ssmurf\s(.*)/i, (res) ->
    postFrom = res.message.room # get the current room
    sender = res.message.user.name.toLowerCase() # get the posters username
    message = res.match[1].trim() # get the message
    postTo = res.match[2].trim() # get the room to post to
    res.send "#{postTo}"
    # res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN) # get the JSON
    #   .get() (error, response, body) ->
    #     json = JSON.parse(body) # parse the JSON
    #     i = 0
    #     j = 0
    #     while i < postTo.length # loop through each channel
    #       while j < json.channels.length # loop through each channel
    #         if json.channels[j].name == postFrom # if the channel matches grab the channel ID so we can make a link
            #   robot.send room: "#{postTo}", "> #{message}\n@#{sender} just posted this in <##{json.channels[j].id}|#{json.channels[j].name}>" # post to the desired channel
            # i++

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
