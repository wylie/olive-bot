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
  robot.hear /(timer\sstart|start\stimer)/i, (res) ->
    startTime = (new Date)
    # startTime = robot.brain.get('startTime')
    if startTime
      res.reply "#{startTime}, Looks like you have a timer going already, you can ask me to stop the timer if you want to start a new one"
    else
      robot.brain.set 'startTime', startTime
      res.reply "The timer has begun! :timer_clock:"

  # stop the timer
  robot.hear /(timer\sstop|stop\stimer)/i, (res) ->
    startTime = robot.brain.get('startTime')
    stopTime = (new Date)
    time = stopTime - startTime
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
    # robot.brain.set 'startTime', 0
    robot.brain.remove 'startTime'

    # display the timer
    robot.hear /(timer\sshow|show\stimer)/i, (res) ->
      startTime = robot.brain.get('startTime')
      # res.reply startTime
      stopTime = (new Date)
      time = stopTime - startTime
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
