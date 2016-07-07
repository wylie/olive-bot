# Description:
#   Keep track of Oslo's milk ounces!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot log N - Log N units of milk
#   hubot daily log - Find out how many units of milk Oslo has had today
#   hubot clear log - Clear the daily log

module.exports = (robot) ->

  babyName = 'Oslo'
  units = 'ounces'
  room = '#oslo'

  #hubot wont grab the number being added…
  #robot.respond /log [0-9]/i, (res) ->
  robot.respond /log (.*)/i, (res) ->
    newMilk = res.match[1]
    oldMilk = robot.brain.get('totalMilk') * 1 or 0

    # keep all this in the Oslo room
    # robot.messageRoom room, "#{babyName} just had #{newMilk} #{units} of milk! :baby_bottle:"
    robot.reply "#{babyName} just had #{newMilk} #{units} of milk! :baby_bottle:"

    # res.reply "#{babyName} just had #{newMilk} #{units} of milk! :baby_bottle:"
    robot.brain.set 'totalMilk', parseFloat(oldMilk)+parseFloat(newMilk)

  robot.respond /daily log/i, (res) ->
    totalMilk = robot.brain.get('totalMilk') * 1 or 0
    if totalMilk < 1
      res.reply "#{babyName} hasn't had any milk yet today :cry:"
    else
      res.reply "#{babyName} has had a total of *#{totalMilk}* #{units} of milk today! :baby_bottle:"

  robot.hear /clear log/i, (res) ->
    robot.brain.set 'totalMilk', 0
    res.reply "The daily log has been cleared :+1:"

  #hour = (new Date).getHours()
  #minutes = (new Date).getMinutes()
  #if hour == 0 and minutes == 0
    #robot.brain.set 'totalMilk', 0
    #robot.send room: 'oslo', "The daily log has been cleared :+1:";
