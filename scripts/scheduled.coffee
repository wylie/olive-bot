# Description:
#   Scheduled comments from Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Wylie

module.exports = (robot) ->

  # days of the week
  setInterval (->
    time = new Date
    day = time.getDay()
    hour = time.getHours()
    minute = time.getMinutes()
    second = time.getSeconds()
    # if hour < 12
    #   suff = 'am'
    # if hour > 12
    #   suff = 'pm'
    # if hour == 0
    #   hour = 12
    # Taco Tuesday
    if day == 2 and hour == 12 and minute == 0
      robot.send room: 'general', "Hooray, it's Taco Tuesday! :taco: TIMMY!!"
    # Burger Friday
    if day == 5 and hour == 12 and minute == 0
      robot.send room: 'general', "Hooray, it's Burger Friday! :hamburger: TIMMY!!"
    return
  ), 60000
