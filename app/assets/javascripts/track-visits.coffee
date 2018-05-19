$(document).on 'turbolinks:load', ->
  track_visits = $('.track-visits')
  if track_visits.length > 0 && track_visits.data('category')?
    $.post '/api/visits',
      { category: track_visits.data('category'), post: track_visits.data('post') }