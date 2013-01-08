express = require 'express'
http = require 'http'
Vein = require 'vein'
Pulsar = require 'pulsar'
{join} = require 'path'
mc = require './mc'
config = require './config'

app = express()
app.use express.static  join __dirname, '../public'

server = http.createServer(app).listen config.port

# RPC
rpc = Vein.createServer server

rpc.addFolder join __dirname, './services'

# PubSub
pulse = Pulsar.createServer server
player = pulse.channel 'player'
events = pulse.channel 'events'

mc.on 'chat', (user, msg, raw) ->
  events.emit 'chat', user, msg, raw

mc.on 'nonSpokenChat', (msg, raw) ->
  events.emit 'chat', null, msg, raw

console.log "Server running on #{config.port}"