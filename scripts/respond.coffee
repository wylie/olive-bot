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
#   hubot wrong answer - Further the "What can you do?" conversation
#   hubot who <query> - Hubot tells you users in the current channel
#   hubot good morning - Give Hubot a morning greeting
#
# Author:
#   Wylie

response = [
  "you're welcome",
  "no problem",
  "not a problem",
  "no problem at all",
  "don’t mention it",
  "it’s no bother",
  "it’s my pleasure",
  "my pleasure",
  "it’s nothing",
  "think nothing of it",
  "no, no. thank you!",
  "sure thing"
]

module.exports = (robot) ->

  # thanks
  robot.respond /thank(s| you)/i, (res) ->
    res.send res.random response
  thanks = new RegExp "thank(s| you) #{robot.name}", "i"
  robot.hear thanks, (res) ->
    res.send res.random response


  # have a soda
  robot.respond /have a (((:.*:))|(.\w+\b))/i, (res) ->
    stuffHad = res.match[1]
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
  robot.respond /speak/i, (res) ->
    res.http("http://dukeofcheese.com/dev/hubot/timmy/speak.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            num = Math.floor(Math.random() * json.speak.length)
            res.send json.speak[num]
          else
            res.send "..."

  robot.respond /lyrics '(.*)'/i, (res) ->
    res.http("http://dukeofcheese.com/dev/hubot/olive/songs.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            songTitle = res.match[1]
            songLyrics = json.songs[songTitle]
            res.send songLyrics
          else
            res.send "..."

  robot.respond /song (.*) by (.*)/i, (res) ->
    songTitle = res.match[1]
    songTitle = songTitle.replace(/\s/i,'%20')
    songArtist = res.match[2]
    songArtist = songArtist.replace(/\s/i,'%20')
    myUrl = "http://api.lyricsnmusic.com/songs?api_key=085157dded76ca409d9cd41b300453&q=#{songArtist}%20#{songTitle}";
    res.http(myUrl)
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode
          when 200
            res.send myUrl
          else
            res.send "..."

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
    res.send (res.random users).split(" ")[0] + " " + res.match[1] + "!"

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
