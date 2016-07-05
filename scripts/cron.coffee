# Description:
#   Defines periodic executions

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'America/New_York'
  # new cronJob('0 0 9 * * 1-5', workdaysNineAm, null, true, tz)
  new cronJob('0 */1 * * * *', everyMinute, null, true, tz)
  room = '#general'

  # workdaysNineAm = ->
  #   robot.emit 'slave:command', 'wake everyone up', room

  everyMinute = ->
    robot.messageRoom room, 'I will nag you every minute'
