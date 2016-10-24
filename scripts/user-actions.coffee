# Description:
#   Hubot can noticecertain user actions
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
#   wylie

module.exports = (robot) ->

  # user enters room
  robot.enter (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "Everybody give a warm welcome to @#{sender}! :wave: I'm Timmy and I'm here to help. Type `Timmy help` to see all my actions. TIMMY!!"

  # user leaves room
  robot.leave (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "So long, @#{sender} :wave: TIMMY!!"
