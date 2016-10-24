# Description:
#   Hubot can log milk
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot log <N> - Log N units of milk
#   hubot log daily - Show what's been logged so far
#   hubot log clear - Clear the log
#
# Author:
#   Wylie

module.exports = (robot) ->

  units = 'ounces'
  # add to log
  robot.respond /log\s([0-9]*)/i, (res) ->
    newMilk = res.match[1]
    oldMilk = robot.brain.get('totalMilk') * 1 or 0
    robot.brain.set 'totalMilk', parseFloat(oldMilk)+parseFloat(newMilk)
    res.reply "Your baby just had #{newMilk} #{units} of milk! :baby_bottle:"

  # show log
  robot.respond /log\sdaily/i, (res) ->
    totalMilk = robot.brain.get('totalMilk') * 1 or 0
    if totalMilk < 1
      res.reply "Your baby hasn't had any milk yet today :cry:"
    else
      res.reply "Your baby has had a total of *#{totalMilk}* #{units} of milk today! :baby_bottle:"

  # clear log
  robot.respond /log\sclear/i, (res) ->
    robot.brain.set 'totalMilk', 0
    res.reply "The daily log has been cleared :+1:"
