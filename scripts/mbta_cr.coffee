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
        # robot.send room: "testing", "#{json.Messages.[0]}"
        while i < json.Messages.length # loop through each channel
        #   if json.channels[i].name == postFrom # if the channel matches grab the channel ID so we can make a link
          robot.send room: "testing", "> #{json.Messages[i].Stop}"
          i++
  #   return
  # ), 6000
