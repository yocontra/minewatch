
define(["app/server", "app/pulse", "templates/index", "templates/chatMessage"], function(server, pulse, indexTempl, chatMessage) {
  var app;
  app = {
    show: function() {
      var renderInfo;
      renderInfo = function(info) {
        $("#main").html(indexTempl(info));
        return $("#chatSend").click(function() {
          return server.sendMessage($("#chatInput").val(), function() {
            return $("#chatInput").val("");
          });
        });
      };
      return server.ready(function() {
        var addMessage, events, player;
        server.getInfo(renderInfo);
        player = pulse.channel('player');
        player.on('update', renderInfo);
        events = pulse.channel('events');
        addMessage = function(user, msg, raw) {
          $("#chatbox").append(chatMessage({
            username: user,
            message: msg
          }));
          return $("#chatbox").scrollTop(999999999);
        };
        return events.on('chat', addMessage);
      });
    }
  };
  return app;
});
