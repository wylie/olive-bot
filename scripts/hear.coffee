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
#   None
#
# Author:
#   Wylie

module.exports = (robot) ->

  # brother
  robot.hear /(\bbrother\b)/i, (msg) ->
    msg.http("http://dukeofcheese.com/dev/hubot/timmy/brother.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            num = Math.floor(Math.random() * json.brother.length)
            msg.send json.brother[num]
          else
            msg.send "..."

  # roberto
  robot.hear /(\bwombat\b)/i, (msg) ->
    msg.http("http://dukeofcheese.com/dev/hubot/timmy/roberto.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            num = Math.floor(Math.random() * json.roberto.length)
            msg.send json.roberto[num]
          else
            msg.send "..."

  # wtf
  robot.hear /\b(wtf)\b/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "WTF is right, @#{sender}. What. The. Fuck. TIMMY!!"

  # get/buy(ing) beer(s)
  robot.hear /(((\bget\b)|(\bbuy\b|\bbuying\b))\s(\bbeer\b|\bbeers\b))/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send ":beers: are on @#{sender} tonight! TIMMY!!"

  # shut up
  robot.hear /(\bshut up\b)/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "No, you shut up @#{sender}! TIMMY!!"

  # zombie jesus
  robot.hear /(\bsweet\b|\bzombie\b|\bjesus\b|\bsweet jesus\b|\bzombie jesus\b|\bsweet zombie jesus\b)/i, (res) ->
    res.send "http://rs777.pbsrc.com/albums/yy59/gaderffii/SweetZombieJesus.jpg~c200"

  # the rock
  robot.hear /(\bsmell\b|\brock\b|\bcooking\b)/i, (res) ->
    res.send "http://www.awesomelyluvvie.com/wp-content/uploads/2014/07/the-rock-fanny-pack.jpg"

  # pokemon
  robot.hear /(caught).* (:pokemon-.*:)/i, (res) ->
    pokemon = res.match[1]
    sender = res.message.user.name.toLowerCase()
    res.send "Good job catching that #{pokemon}, @#{sender}! TIMMY!!"

  # kill
  robot.hear /i will (\bend\b|\bdestroy\b|\bkill\b) you/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "Not before I kill you, @#{sender}! TIMMY!!"

  # not now timmy
  notNow = new RegExp "(not now #{robot.name}|#{robot.name}(, not now|\snot now))", "i"
  robot.hear notNow, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "If not now, when @#{sender}? TIMMY!!"

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
    j = 0
    res.http("https://slack.com/api/channels.list?token=" + process.env.HUBOT_SLACK_TOKEN) # get the JSON
    .get() (error, response, body) ->
      json = JSON.parse(body) # parse the JSON
      while j < json.channels.length # loop through each channel
        if json.channels[j].name == postFrom # if the channel matches grab the channel ID so we can make a link
          robot.brain.set "room_id", "#{json.channels[j].id}"
          j++
    i = 0
    roomId = robot.brain.get('room_id')
    while i < channelList.length
      robot.send room: "#{channelList[i]}", "> #{message}\n@#{sender} just posted this in <##{roomId}|#{postFrom}>" # post to the desired channel
      # robot.send room: "#{channelList[i]}", "> #{message}\n@#{sender} just posted this in ##{postFrom}" # post to the desired channel
      i++
