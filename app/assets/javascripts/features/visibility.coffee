$ ->
  cache = new App.Cache

  $(document).on 'click', '[data-visibility]', (e) ->
    e.preventDefault()

    id = $(e.target).data('visibility')
    $target = cache.get(id) or cache.set(id, $(id))

    if $target.stop().is(':visible')
      $target.slideUp   'fast', -> $target.trigger 'visibility:hidden'
    else
      $target.slideDown 'fast', -> $target.trigger 'visibility:shown'
