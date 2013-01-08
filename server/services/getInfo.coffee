mc = require '../mc'

module.exports = (cb) ->
  info =
    radar: mc.radar
    player:
      username: mc.entity.username
      health: mc.health
      food: mc.food

  cb info