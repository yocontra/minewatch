mc = require '../mc'

module.exports = (cb, msg) ->
  mc.chat msg
  cb()