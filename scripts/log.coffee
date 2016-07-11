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

  robot.respond /log (.*)/i, (res) ->
    newMilk = res.match[1]
    oldMilk = robot.brain.get('totalMilk') * 1 or 0
    robot.brain.set 'totalMilk', parseFloat(oldMilk)+parseFloat(newMilk)
    res.reply "#{babyName} just had #{newMilk} #{units} of milk! :baby_bottle:"

  robot.respond /daily log/i, (res) ->
    totalMilk = robot.brain.get('totalMilk') * 1 or 0
    if totalMilk < 1
      res.reply "#{babyName} hasn't had any milk yet today :cry:"
    else
      res.reply "#{babyName} has had a total of *#{totalMilk}* #{units} of milk today! :baby_bottle:"

  robot.hear /clear log/i, (res) ->
    robot.brain.set 'totalMilk', 0
    res.reply "The daily log has been cleared :+1:"

  hour = (new Date).getHours()
  minutes = (new Date).getMinutes()
  if hour == 0 and minutes == 0
    robot.brain.set 'totalMilk', 0
    robot.send room: 'oslo', "The daily log has been cleared :+1:";
    
  if hour == 14 and minutes == 0
    robot.brain.set 'totalMilk', 0
    robot.send room: 'oslo', "The daily log has been cleared :+1:";
