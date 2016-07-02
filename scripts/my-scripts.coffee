module.exports = (robot) ->
  robot.hear /badger/i, (res) ->
    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

  robot.topic (res) ->
    res.send "Are you sure you want change the channel topic to #{res.message.text}? "

  robot.hear /speak/i, (res) ->
    res.send "Woof"
