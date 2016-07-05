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

  room = '#general'

  robot.send room: 'general', "This is a 'spontaneous' message"
