$ ->
  $container = $("#messages")

  append = (text) ->
    $li = $("<li />").addClass('list-group-item').text(text)
    $container.append $li
    $("html, body").animate { scrollTop: $(document).height() }, 500, 'swing'

  wait = 1

  connect = ->
    append "connecting..."
    sock = new SockJS($container.data('node-url'))
    sock.onopen = (e) ->
      wait = 1
      append "...connected"
    sock.onmessage = (e) ->
      append e.data
    sock.onclose = (e) ->
      append "disconnected"
      append "trying to reconnect in #{wait} seconds"
      setTimeout connect, wait * 1000
      wait *= 2
    window.sock = sock

  connect()
