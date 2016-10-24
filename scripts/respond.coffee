# Description:
#   Let's hear Hubot speak!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot have a soda - Give Hubot a soda
#   hubot sleep it off - Fix Hubot's soda habit
#   hubot speak - Hubot speaks
#   hubot lyrics <query> - Hubot can get lsome custom lyrics
#   hubot song <song> by <artist> - Hubot can find song lyrics
#   hubot song - Say hi to Hubot
#   hubot user - Hubot tells you your username
#   hubot channel - Hubot tells you what channel you are in
#   hubot hi - Say hi to Hubot
#   hubot what can you do - Find out what hubot can do
#   hubot wrong answer - Further the conversation
#   hubot who <query> - Hubot tells you users in the current channel
#   hubot good morning - Give Hubot a morning greeting
#
# Author:
#   Wylie

module.exports = (robot) ->

  # have a soda
  robot.respond /have a (((:.*:))|(.\w+\b))/i, (res) ->
    stuffHad = res.match[1]
    #res.reply stuffHad
    stuffTotal = robot.brain.get('totalStuff') * 1 or 0
    if stuffTotal > 4
      res.reply "I'm too full for any more..."
    else
      res.reply "Sure, I love #{stuffHad} TIMMY!!"
    robot.brain.set 'totalStuff', stuffTotal+1

  robot.respond /sleep it off/i, (res) ->
    robot.brain.set 'totalStuff', 0
    res.reply "zzzzz"

  # speak
  robot.respond /speak/i, (msg) ->
    msg.http("http://dukeofcheese.com/dev/hubot/timmy/speak.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            num = Math.floor(Math.random() * json.speak.length)
            msg.send json.speak[num]
          else
            msg.send "..."

  robot.respond /lyrics '(.*)'/i, (msg) ->
    msg.http("http://dukeofcheese.com/dev/hubot/olive/songs.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            songTitle = msg.match[1]
            songLyrics = json.songs[songTitle]
            msg.send songLyrics
          else
            msg.send "..."

  robot.respond /song (.*) by (.*)/i, (msg) ->
    songTitle = msg.match[1]
    songTitle = songTitle.replace(/\s/i,'%20')
    songArtist = msg.match[2]
    songArtist = songArtist.replace(/\s/i,'%20')
    myUrl = "http://api.lyricsnmusic.com/songs?api_key=085157dded76ca409d9cd41b300453&q=#{songArtist}%20#{songTitle}";
    msg.http(myUrl)
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            msg.send myUrl
          else
            msg.send "..."

  # user
  robot.respond /user/i, (res) ->
    res.reply res.message.user.name

  # room
  robot.respond /channel/i, (res) ->
    room = res.message.room
    res.send "This channel is: ##{room} :house_with_garden:"

  # hi
  robot.respond /(\bhi\b)/gi, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "HI @#{sender}! TIMMY!!"

  # kick your butt
  robot.respond /(what\scan\syou\sdo)/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "I can kick your ass, @#{sender}! :knife: TIMMY!!"

  # sorry
  robot.respond /(wrong\sanswer)/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "Sorry, @#{sender}, what would you have my answer be?"

  # who's in this room
  robot.respond /(who) (.+)\?/i, (res) ->
    users = []
    for own key, user of robot.brain.users
      users.push "#{user.name}" if "#{user.name}" != robot.name
    res.send (res.random users).split(" ")[0] + " " + res.match[2] + "!"

  # Timmy good morning
  robot.respond /good morning/i, (res) ->
    res.http("http://dukeofcheese.com/dev/hubot/timmy/speak.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            num = Math.floor(Math.random() * json.speak.length)
            sender = res.message.user.name.toLowerCase()
            res.reply "Good morning, @#{sender}! " + json.speak[num]
          else
            res.reply "..."
