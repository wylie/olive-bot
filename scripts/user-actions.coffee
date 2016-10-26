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
    room = res.message.room
    if room == 'testing'
      res.send "Everybody give a warm welcome to @#{sender}! :wave: I'm Timmy and I'm here to help!\nType `Timmy help` to see all my actions. TIMMY!!\n*FYI* you may want to `/mute` this channel…"
    else
      res.send "Everybody give a warm welcome to @#{sender}! :wave: I'm Timmy and I'm here to help!\nType `Timmy help` to see all my actions. TIMMY!!"

  # user leaves room
  robot.leave (res) ->
    sender = res.message.user.name.toLowerCase()
    res.send "So long, @#{sender} :wave: TIMMY!!"
