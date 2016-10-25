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
#   hubot who <query> - Hubot tells you users in the current channel
#   hubot good morning - Give Hubot a morning greeting
#   hubot thanks - Give thanks to Hubot
#   hubot what day is it - Ask Hubot what day it is
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
speak = [
  "LIVIN' A LIE!!",
  "TIMMY!!",
  "TIMMEH!!"
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

  # sleep it off
  robot.respond /sleep it off/i, (res) ->
    robot.brain.set 'totalStuff', 0
    res.reply "zzzzz"

  # speak
  hubotSpeaks = new RegExp "(speak #{robot.name}|#{robot.name} speak)", "i"
  robot.hear hubotSpeaks, (res) ->
    res.send res.random speak

  # lyrics
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

  # song lyrics
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
  robot.respond /\b(hi)\b/i, (res) ->
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
  robot.respond /(who)\s(.+)\?/i, (res) ->
    users = []
    for own key, user of robot.brain.users
      users.push "#{user.name}" if "#{user.name}" != robot.name
    res.send (res.random users).split(" ")[0] + " " + res.match[1] + "!"

  # Timmy good morning
  goodMorning = new RegExp "(good morning #{robot.name}|#{robot.name} good morning)", "i"
  robot.hear goodMorning, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.reply "Good morning, @#{sender}! :sunrise: " + res.random speak

  # TESTING
  robot.respond /(what\scan\syou\sdo)/i, (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "I can kick your ass, @#{sender}! :knife: TIMMY!!"


  # ask Timmy what day it is
  # whatDayIsIt = new RegExp "(what day is it #{robot.name}|#{robot.name} what day is it)", "i"
  # robot.hear whatDayIsIt, (res) ->
  #   sender = res.message.user.name.toLowerCase()
  #   time = new Date
  #   day = time.getDay()
  #   # Monday
  #   if day == 1
  #     robot.reply "Hey @#{sender}, today is Monday! :+1:" + res.random speak
  #   # Taco Tuesday
  #   if day == 2
  #     robot.reply "Hey @#{sender}, it's Taco Tuesday! :taco:" + res.random speak
  #   # Wednesday
  #   if day == 3
  #     robot.reply "Hey @#{sender}, today is Wednesday! :tangotucan:" + res.random speak
  #   # Thursday
  #   if day == 4
  #     robot.reply "Hey @#{sender}, today is Thursday! :aw_yeah:" + res.random speak
  #   # Burger Friday
  #   if day == 5
  #     robot.reply "Hey @#{sender}, it's Burger Friday! :hamburger:" + res.random speak
  #   # Saturday
  #   if day == 6
  #     robot.reply "Hey @#{sender}, today is Saturday! :pump_girl:" + res.random speak
  #   # Sunday
  #   if day == 7
  #     robot.reply "Hey @#{sender}, today is Sunday! :tada:" + res.random speak
