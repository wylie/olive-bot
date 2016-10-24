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

module.exports = (robot) ->

  # choose between
  robot.respond /choose\sbetween ([^"]+)/i, (res) ->
      options = sg.match[1].split(' ')
      # res.reply("Definitely \"#{res.random options}\".")
      res.reply "You entered: #{options}"

  # coin
  robot.respond /(throw|flip|toss) a coin/i, (res) ->
    res.reply res.random thecoin

  # dice
  robot.respond /(throw|roll|toss) the di(e|ce)/i, (res) ->
    res.reply res.random thedie

  robot.respond /(eightball|8ball)(.*)/i, (res) ->
    res.reply "#{res.random ball} :magic8ball: TIMMEH!!"
