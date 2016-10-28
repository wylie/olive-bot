# Description:
#   Scheduled comments from Hubot
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

  # days of the week
  # setInterval (->
  robot.hear /\bmbta\b/i, (res) ->
    res.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
      .get() (error, response, body) ->
        json = JSON.parse(body) # parse the JSON
        robot.send room: "testing", "#{json.messages.destination}"
        # while i < json.channels.length # loop through each channel
        #   if json.channels[i].name == postFrom # if the channel matches grab the channel ID so we can make a link
        #     robot.send room: "#{postTo}", "> #{message}\n@#{sender} just posted this in <##{json.channels[i].id}|#{json.channels[i].name}>" # post to the desired channel
        #   i++
  #   return
  # ), 6000
