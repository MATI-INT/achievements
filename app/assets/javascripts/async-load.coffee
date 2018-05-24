$(document).on 'turbolinks:load', ->
  $('.async-load').click (e) ->
    e.preventDefault()
    $this = $(this) # this - объект относительно которого исполняется функция
    $.get $this.attr('href'), (data) ->
      $target = $( $this.data('target') )
      $target.html(data)