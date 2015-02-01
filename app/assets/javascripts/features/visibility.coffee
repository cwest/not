$ ->
  cache = new App.Cache

  $('[data-visibility]').on 'click', (e) ->
    id = $(e.target).data('visibility')
    $target = cache.get(id) || cache.set(id, $(id))
    $target.slideToggle('fast')
    e.preventDefault()
