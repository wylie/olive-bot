module.exports = (robot) ->
  robot.hear /badger/i, (res) ->
    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

  robot.topic (res) ->
    res.send "#{res.message.text}? That's an odd topic…"
