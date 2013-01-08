define ["app/server", "app/pulse", "templates/index", "templates/chatMessage"], (server, pulse, indexTempl, chatMessage) ->
  app = 
    show: ->
      renderInfo = (info) ->
        $("#main").html indexTempl info
        $("#chatSend").click ->
          server.sendMessage $("#chatInput").val(), ->
            $("#chatInput").val("")

      server.ready ->
        server.getInfo renderInfo
        player = pulse.channel 'player'
        player.on 'update', renderInfo

        events = pulse.channel 'events'

        addMessage = (user, msg, raw) ->
          $("#chatbox").append chatMessage
            username: user
            message: msg
          $("#chatbox").scrollTop 999999999
        events.on 'chat', addMessage

  return app
