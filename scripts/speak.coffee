# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   `hubot speak` - Hubot speaks!
#
# Author:
#   wylie

module.exports = (robot) ->
  speaks = ['Woof', 'Bark', 'Grrr']
  robot.respond /speak/i, (res) ->
    res.send res.random speaks
