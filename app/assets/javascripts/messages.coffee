sock = new SockJS($("#messages").data('node-url'))
sock.onmessage = (e) ->
  $li = $("<li />").text(e.data)
  $li.appendTo $("#messages")
  $('#new_message')[0].reset()
