$('a.hide-speaker').click (event) ->
  event.preventDefault()
  $(@).closest('.outgoing-speaker').hide()

$('a.prepare-copy').click (event) ->
  event.preventDefault()
  $('.row a, h2 a').hide()
