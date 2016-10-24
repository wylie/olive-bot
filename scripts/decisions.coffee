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
#   hubot choose between N - Hubot can help you choose between two things
#   hubot pick one <text> or <text>?
#   hubot throw/flip/toss a coin - Heads or tails?
#   hubot throw/roll/toss a die - Get a number 1–6
#   hubot eightball/8ball - Get a Magic Eight Ball answer
#
# Author:
#   Wylie

thecoin = ['heads', 'tails']
thedie = [1, 2, 3, 4, 5, 6]
ball = [
  "It is certain",
  "It is decidedly so",
  "Without a doubt",
  "Yes – definitely",
  "You may rely on it",
  "As I see it, yes",
  "Most likely",
  "Outlook good",
  "Signs point to yes",
  "Yes",
  "Reply hazy, try again",
  "Ask again later",
  "Better not tell you now",
  "Cannot predict now",
  "Concentrate and ask again",
  "Don't count on it",
  "My reply is no",
  "My sources say no",
  "Outlook not so good",
  "Very doubtful",
]
uhh_what = [
    "I could tell you, but then I'd have to kill you",
    "Answering that would be a matter of national security",
    "You can't possibly compare them!",
    "Both hold a special place in my heart"
  ]

module.exports = (robot) ->

  # choose between
  robot.respond /choose between ([^"]+)/i, (res) ->
      options = res.match[1].split(' ')
      res.reply("Definitely \"#{res.random options}\".")

  # pick one
  robot.respond /pick one:* (.*) or (.*?)\??$/i, (res) ->
    choosen_response = res.random [1..5]
    num = res.random [1..2]
    if choosen_response >= 3
      res.send res.random uhh_what
    else
      res.send "Clearly #{res.match[choosen_response]} is better"

  # coin
  robot.respond /(throw|flip|toss) a coin/i, (res) ->
    res.reply res.random thecoin

  # dice
  robot.respond /(throw|roll|toss) the di(e|ce)/i, (res) ->
    res.reply res.random thedie

  robot.respond /(eightball|8ball)(.*)/i, (res) ->
    res.reply "#{res.random ball} :magic8ball: TIMMEH!!"
