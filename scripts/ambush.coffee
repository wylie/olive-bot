# Description:
#   Send messages to users the next time they speak
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ambush <user name>: <message>
#
# Author:
#   jmoses
#   Wylie

appendAmbush = (data, toUser, fromUser, message) ->
  data[toUser.name] or= []

  data[toUser.name].push [fromUser.name, message]

module.exports = (robot) ->
  robot.brain.on 'loaded', =>
    robot.brain.data.ambushes ||= {}

  robot.respond /ambush (.*?): (.*)/i, (res) ->
    users = robot.brain.usersForFuzzyName(res.match[1].trim())
    if users.length is 1
      user = users[0]
      appendAmbush(robot.brain.data.ambushes, user, res.message.user, "#{res.match[2]} sent at #{new Date()}")
      res.send "Ambush prepared"
    else if users.length > 1
      res.send "Too many users like that"
    else
      res.send "#{res.match[1]}? Never heard of 'em"

  robot.hear /./i, (res) ->
    return unless robot.brain.data.ambushes?
    if (ambushes = robot.brain.data.ambushes[res.message.user.name])
      for ambush in ambushes
        res.send "hey #{res.message.user.name}, #{ambush[1]}"
      delete robot.brain.data.ambushes[res.message.user.name]
