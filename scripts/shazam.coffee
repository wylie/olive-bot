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
    i = 0
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN) # get the JSON
      .get() (error, response, body) ->
        json = JSON.parse(body) # parse the JSON
        while i < json.channels.length # loop through each channel
          if json.channels[i].name == postFrom # if the channel matches grab the channel ID so we can make a link
            robot.send room: "#{postTo}", "> #{message}\n@#{sender} just posted this in <##{json.channels[i].id}|#{json.channels[i].name}>" # post to the desired channel
          i++

  # post in multiple other rooms
  robot.hear /(.*)\smulti\s(.*)/i, (res) ->
    postFrom = res.message.room # get the current room
    sender = res.message.user.name.toLowerCase() # get the posters username
    message = res.match[1].trim() # get the message
    postTo = res.match[2].trim() # get the room to post to
    channelList = postTo.split(/\s/) # split apart the post to arr
    i = 0
    while i < channelList.length
      robot.send room: "#{channelList[i]}", "> #{message}\n@#{sender} just posted this in ##{postFrom}" # post to the desired channel
      i++

  robot.hear /chan/i, (res) ->
    res.send msg.channel_id
