# Description:
#   Hubot can time things!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot timer start - Start the timer
#   hubot timer stop - Stop the timer
#   hubot timer show - Show the timers progress
#
# Author:
#   Wylie

module.exports = (robot) ->

  # stop the timer
  robot.respond /timer\sstart/i, (res) ->
    oldTime = (new Date)
    robot.brain.set 'oldTime', oldTime
    res.reply "The timer has begun! :timer_clock:"

  # stop the timer
  robot.respond /timer\sstop/i, (res) ->
    oldTime = robot.brain.get('oldTime')
    newTime = (new Date)
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
    res.reply "Total time: *#{final}*! :timer_clock: :+1:"
    robot.brain.set 'oldTime', 0

    # display the timer
    robot.respond /timer\sshow/i, (res) ->
      oldTime = robot.brain.get('oldTime')
      newTime = (new Date)
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
              res.reply "The timer has been going for: *#{final}*! :timer_clock:"
