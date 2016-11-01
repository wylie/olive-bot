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

  # setInterval (->
  #   robot.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
  #     .get() (error, response, body) ->
  #       json = JSON.parse(body) # parse the JSON
  #       robot.send room: 'mbta', "#{json.Messages[1].Stop}"
  #     return
  # ), 2000


  # days of the week
  setInterval (->
    robot.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
      .get() (error, response, body) ->
        json = JSON.parse(body) # parse the JSON
        while i < json.Messages.length.toLowerCase() # loop through each channel
          robot.send room: 'mbta', "#{i}"
          # robot.send room: 'mbta', "> The Stop is #{json.Messages[i].Stop} and it's scheduled for #{json.Messages[i].Scheduled}"
    return
  ), 6000


  # setInterval (->
  #   robot.hear /\bmbta\s(.*)\b/i, (res) ->
  #     myStop = res.match[1].trim() # get the stop
  #     if myStop
  #       robot.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
  #         .get() (error, response, body) ->
  #           json = JSON.parse(body) # parse the JSON
  #           # robot.send "#{json.Messages[1].Stop}"
  #           while i < json.Messages.length.toLowerCase() # loop through each channel
  #             # robot.send "#{json.Messages[1].Stop}"
  #             # jsonStop = json.Messages[i].Stop
  #             if json.Messages[i].Stop == myStop # if the channel matches grab the channel ID so we can make a link
  #               robot.send room: 'mbta', "> The Stop is #{json.Messages[i].Stop} and it's scheduled for #{json.Messages[i].Scheduled}"
  #             else
  #               robot.send room: 'mbta', "Couldn't get the info"
  #             i++
  #     else
  #       res.send "No stop supplied"
  #   return
  # ), 6000
