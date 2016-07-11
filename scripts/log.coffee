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

  robot.respond /start timer/i, (res) ->
    oldTime = (new Date)
    robot.brain.set 'startTimer', oldTime
    res.reply "The timer has begun! :timer_clock:"
    # newTime = (new Date).getTime()
    # time = newTime - oldTime
    # hour = new Date(time).getHours()
    # minute = new Date(time).getMinutes()
    # second = new Date(time).getSeconds()
    # final = ''
    # if hour > 0
    #   final += hour + ' hour, '
    # if hour > 0 or minute > 0
    #   final += minute + ' minutes and '
    # if second >= 0
    #   if second > 1
    #     final += second + ' seconds'
    #   else
    #     final += second + ' second'
    # res.innerHTML = final

  robot.respond /stop timer/i, (res) ->
    newTime = (new Date)
    oldTime = robot.brain.get('oldTime')
    time = newTime - oldTime
    hour = new Date(time).getHours()
    minute = new Date(time).getMinutes()
    second = new Date(time).getSeconds()
    final = ''
    if hour > 0
      final += hour + ' hour, '
    if hour > 0 or minute > 0
      final += minute + ' minutes and '
    if second >= 0
      if second > 1
        final += second + ' seconds'
      else
        final += second + ' second'
    res.reply "Total time: #{final}! :timer_clock:"
    robot.brain.set 'newTime', 0
    robot.brain.set 'oldTime', 0
  
  # robot.respond /start timer/i, (res) ->
  #   begin = (new Date).getTime()
  #   robot.brain.set 'startTimer', begin
  #   res.reply "The timer has begun! :timer_clock: "
  # 
  # robot.respond /stop timer/i, (res) ->
  #   end = (new Date).getTime()
  #   begin = robot.brain.get('begin')
  #   length = begin - end
  #   time = length / 1000
  #   robot.brain.set 'startTimer', begin
  #   res.reply "Total time: #{length}! :timer_clock: "

  robot.respond /daily log/i, (res) ->
    totalMilk = robot.brain.get('totalMilk') * 1 or 0
    if totalMilk < 1
      res.reply "#{babyName} hasn't had any milk yet today :cry:"
    else
      res.reply "#{babyName} has had a total of *#{totalMilk}* #{units} of milk today! :baby_bottle:"

  robot.hear /clear log/i, (res) ->
    robot.brain.set 'totalMilk', 0
    res.reply "The daily log has been cleared :+1:"

#  hour = (new Date).getHours()
#  minutes = (new Date).getMinutes()
#  if hour == 0 and minutes == 0
#    robot.brain.set 'totalMilk', 0
#    robot.send room: 'oslo', "The daily log has been cleared :+1:";
#  if hour == 14 and minutes == 0
#    robot.brain.set 'totalMilk', 0
#    robot.send room: 'oslo', "The daily log has been cleared :+1:";
