sock = new SockJS('http://localhost:5000/broadcast')
sock.onmessage = (e) ->
  console.log('message', e.data)
