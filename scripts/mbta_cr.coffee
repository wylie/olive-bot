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
  # robot.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
  #   .get() (error, response, body) ->
  #     json = JSON.parse(body) # parse the JSON
  #     setInterval ()->
  #       # while i < json.Messages.length.toLowerCase() # loop through each channel
  #         # if i == 3
  #       # res.send room: 'mbta', "blammo"
  #       robot.send room: 'mbta', "> The Stop is #{json.Messages[i].Stop} and it's scheduled for #{json.Messages[i].Scheduled}"
  #      return
  #     , 6000

  robot.hear /\blittle\sslow\b/i, (res) ->
    setTimeout () ->
      robot.send room: 'mbta', "Who you calling 'slow'?"
    , 60 * 1000

  robot.hear /\bannoy\b/i, (res) ->
    res.send "Hey, want to hear the most annoying sound in the world?"
    setInterval () ->
      robot.send room: 'mbta', "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
    , 1000

  robot.hear /\bmbta\s(.*)\b/i, (msg) ->
    msg.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
      .get() (err, res, body) ->
        json = JSON.parse(body)
        if json.Messages[1].Stop == myStop # if the channel matches grab the channel ID so we can make a link
          msg.send myStop
        #
        # while i < json.Messages.length.toLowerCase() # loop through each channel
        #   msg.send json.Messages[i].Stop

  robot.hear /\bmbtass\s(.*)\b/i, (res) ->
    res.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            myStop = res.match[1]
            yourStop = json.Messages[1].Stop
            res.send myStop
          else
            res.send "..."

  robot.hear /\bmbtas\s(.*)\b/i, (res) ->
    myStop = res.match[1].trim() # get the stop
    res.send "#{myStop}"
    robot.http('http://developer.mbta.com/lib/RTCR/RailLine_12.json') # get the JSON
      .get() (error, response, body) ->
        json = JSON.parse(body) # parse the JSON
        while i < json.Messages.length.toLowerCase() # loop through each channel
          if json.Messages[i].Stop == myStop # if the channel matches grab the channel ID so we can make a link
            robot.send room: 'mbta', "> The Stop is #{json.Messages[i].Stop} and it's scheduled for #{json.Messages[i].Scheduled}"
          else
            robot.send room: 'mbta', "Couldn't get the info"
          i++

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
