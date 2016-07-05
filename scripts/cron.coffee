# Description:
#   Defines periodic executions

module.exports = (robot) ->
  # cronJob = require('cron').CronJob
  # tz = 'America/New_York'
  #
  # new cronJob('0 */1 * * * *', everyMinute, null, true, tz)
  # room = '#general'
  #
  # everyMinute = ->
  #   robot.messageRoom room, 'I will nag you every minute'

  time = Math.rand() * 10000;

  setInterval () ->
    robot.send room: 'testing', "This is a 'spontaneous' message"
  , parseFloat(time)
