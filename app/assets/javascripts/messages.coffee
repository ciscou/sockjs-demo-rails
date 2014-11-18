$ ->
  container = $("#messages")

  append = (text) ->
    $li = $("<li />").text(text)
    $li.appendTo container

  wait = 1

  connect = ->
    sock = new SockJS(container.data('node-url'))
    sock.onopen = (e) ->
      wait = 1
      append "connected"
    sock.onmessage = (e) ->
      append e.data
    sock.onclose = (e) ->
      append "disconnected"
      append "trying to reconnect in #{wait} seconds..."
      setTimeout connect, wait * 1000
      wait *= 2

  connect()
