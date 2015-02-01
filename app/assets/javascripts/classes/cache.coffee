App = window.App ||= {}
App.Cache = class Cache
  constructor: (@cache = {}) ->
  set: (id, value) -> @cache[id] = value
  get: (id) -> @cache[id]

