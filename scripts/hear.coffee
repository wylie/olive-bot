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
#   hubot eightball - Get a Magic Eight Ball answer
#   hubot flip a coin - Flip a coin
#   hubot roll the die - Roll the dice
#   hubot have a [anything] - eat or drink anything
#   hubot speak - It speaks!
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
