sock = new SockJS('http://localhost:5000/broadcast')
sock.onmessage = (e) ->
  $li = $("<li />").text(e.data)
  $li.appendTo $("#messages")
  $('#new_message')[0].reset()
