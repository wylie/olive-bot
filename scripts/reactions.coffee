# Description:
#   Hubot will automatically add reactions when it hears certain words/phrases!
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

  # beer
  robot.hear /\bbeer\b/i, (res) ->
    queryData =  {
      token: process.env.HUBOT_SLACK_TOKEN
      name: "beer"
      channel: res.message.rawMessage.channel # required with timestamp, uses rawMessage to find this
      timestamp: res.message.id # this id is no longer undefined
    }
    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # cat(s)
  robot.hear /(\bcat\b|\bcats\b)/i, (res) ->
    queryData =  {
      token: process.env.HUBOT_SLACK_TOKEN
      name: "cat"
      channel: res.message.rawMessage.channel # required with timestamp, uses rawMessage to find this
      timestamp: res.message.id # this id is no longer undefined
    }
    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # banana
  robot.hear /\bban(ana|anas)\b/i, (res) ->
    queryData =  {
      token: process.env.HUBOT_SLACK_TOKEN
      name: "banana"
      channel: res.message.rawMessage.channel # required with timestamp, uses rawMessage to find this
      timestamp: res.message.id # this id is no longer undefined
    }
    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # taco
  robot.hear /\btaco\b/i, (res) ->
    queryData =  {
      token: process.env.HUBOT_SLACK_TOKEN
      name: "taco"
      channel: res.message.rawMessage.channel # required with timestamp, uses rawMessage to find this
      timestamp: res.message.id # this id is no longer undefined
    }
    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # sass
  robot.hear /\b((sa|c|le)ss)\b/i, (res) ->
    queryData =  {
      token: process.env.HUBOT_SLACK_TOKEN
      name: "sass"
      channel: res.message.rawMessage.channel # required with timestamp, uses rawMessage to find this
      timestamp: res.message.id # this id is no longer undefined
    }
    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # kanye
  robot.hear /\bkanye\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "kanye"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # 100
  robot.hear /\b(awesome|success)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "100"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # hamburger
  robot.hear /\b(ham)|burger\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "hamburger"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # star
  robot.hear /\b(props|star)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "star"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # lee
  robot.hear /\blee\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "lee"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # sunrise
  robot.hear /\b(good\smorning|morning)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "sunrise"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # sushi
  robot.hear /\bsushi\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "sushi"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # coffee
  robot.hear /\bcoffee\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "coffee"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # dickbutt
  robot.hear /\b(dick|butt|dickbutt|richard)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "dickbutt"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # computer
  robot.hear /\b(laptop|computer|work|working)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "computer"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # moneybag
  robot.hear /\b(paid|money|cash|expensive|expenses|riches)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "moneybag"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # the_horns
  robot.hear /\brock(\son|er|\sand\sroll|\s&\sroll|in|)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "the_horns"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # medal
  robot.hear /\b(good\sjob|well\sdone)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "medal"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # amazon
  robot.hear /\bamazon\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "amazon"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # esimons
  robot.hear /\be(van\ssimons|van|simons)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "esimons"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  robot.hear /\bro(b|bs|berto|bsface|bsfault)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "robsface"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return


  # matt-pivnick
  robot.hear /\bm(att\spivnick|att|pivnick)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "matt-pivnick"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # timmy
  robot.hear /\btimmy\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "timmy"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # rbl
  robot.hear /\br(yan\sleach|yan|leach|bl)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "rbl"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # greg-jones
  robot.hear /\bg(reg|jjones)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "greg-jones"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # trent
  robot.hear /\b(trent|dragonegger2)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "trent"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # wylie
  robot.hear /\bwy(lie|liefisher)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "wylie"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # burrito
  robot.hear /\bburrito\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "burrito"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # meat_on_bone
  robot.hear /\bbbq\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "meat_on_bone"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # my_little_pony
  robot.hear /\b(rob|robs|roberto|robsface|robsfault)\b|\b(pony|my\slittle\spony)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "my_little_pony"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # flowdock
  robot.hear /\bflowdock\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "flowdock"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # starbucks
  robot.hear /\bstarbucks\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "starbucks"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # hocho
  robot.hear /\b(stab|knife|cut\syou|end\syou|destroy\syou)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "hocho"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # middle_finger
  robot.hear /\b(fuck|fucker|fuckers)\b|\b(ass|asshole|assholes)\b|\b(jerk|jerks)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "middle_finger"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # appleinc
  robot.hear /\b(os\sx|apple|mac|macintosh|iphone|apple\swatch)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "appleinc"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # google
  robot.hear /\b(google|search)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "google"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # git
  robot.hear /\bgit\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "git"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # github
  robot.hear /\bgithub\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "github"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # facebook
  robot.hear /\bfacebook\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "facebook"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # drupal
  robot.hear /\b(amy|ooh\sooh|um|drupal)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "drupal"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # amy
  robot.hear /\b(amy|ooh\sooh|um|drupal)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "amy"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # keanu
  robot.hear /\b(w(hoa|hoah|oah))|(keanu)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "keanu"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # spiderman
  robot.hear /\bspid(erman|ey|er)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "spiderman"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # starwars
  robot.hear /\b(star\swars|starwars|rogue\sone)\b|\b(empire|rebel)\b|\b(darth\svader|darth|vader|anakin)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "starwars"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # empire
  robot.hear /\b(star\swars|starwars|rogue\sone)\b|\b(empire)\b|\b(darth\svader|darth|vader|anakin)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "starwars_empire"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # rebel
  robot.hear /\b(star\swars|starwars|rogue\sone)\b|\b(rebel)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "starwars_rebel"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # darth_vader
  robot.hear /\b(star\swars|starwars|rogue\sone)\b|\b(empire)\b|\b(father|darth\svader|darth|vader|anakin)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "starwars_darth_vader"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # cheese
  robot.hear /\bcheese\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "cheese"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # skull
  robot.hear /\b(skull|cheese|die)\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "skull"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # photoshop
  robot.hear /\bphotoshop\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "photoshop"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # surprise
  robot.hear /\bsurprise\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "surprise"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # flamingo
  robot.hear /\bflamingo\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "flamingo"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # peach
  robot.hear /\b(peach|bu(tt|tts))\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "peach"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # chicken
  robot.hear /\bchicken\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "chicken"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # slack
  robot.hear /\bslack\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "slack"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  # pepsi
  robot.hear /\bpepsi\b/i, (res) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "pepsi"
        channel: res.message.rawMessage.channel
        timestamp: res.message.id
      }

    if (queryData.timestamp?)
      res.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          return

  robot.hear /\bi(ts|t's)\snot\srobs\sfault\b/i, (res) ->
    smpl = [
      "nyancat_big"
      "bomb"
      "star"
      "aw_yeah"
      "taco"
      "dickbutt"
      "middle_finger"
      "beer"
      "matt-pivnick"
      "sausage_punch"
      "robsface"
      "esimons"
      "wylie"
      "rabbit_dance_pose"
      "lee"
      "greg-jones"
      "tangotucan"
      "pump_girl"
      "my_little_pony"
      "skull"
      "timmy"
      "bmo"
      "keanu"
      "futurama_fry"
      "kanye"
      "empire"
      "rebel"
      "cheese"
    ]
    x = 0
    while x < smpl.length
      queryData =  {
          token: process.env.HUBOT_SLACK_TOKEN
          name: smpl[x]
          channel: res.message.rawMessage.channel
          timestamp: res.message.id
        }
      x++

      if (queryData.timestamp?)
        res.http("https://slack.com/api/reactions.add")
          .query(queryData)
          .post() (err, res, body) ->
              return
