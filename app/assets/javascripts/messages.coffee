$ ->
  container = $("#messages")
  sock = new SockJS(container.data('node-url'))
  sock.onmessage = (e) ->
    $li = $("<li />").text(e.data)
    $li.appendTo container
