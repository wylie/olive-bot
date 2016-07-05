# Description:
#   Defines periodic executions

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'America/Los_Angeles'
  # new cronJob('0 0 9 * * 1-5', workdaysNineAm, null, true, tz)
  new cronJob('0 */1 * * * *', everyFiveMinutes, null, true, tz)

  room = '#testing'

  # workdaysNineAm = ->
  #   robot.emit 'slave:command', 'wake everyone up', room

  everyFiveMinutes = ->
    robot.messageRoom room, 'I will nag you every 5 minutes'
