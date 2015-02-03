App = window.App ||= {}
App.Cache = class Cache
  constructor: (@cache = {}) -> undefined
  set: (id, value) -> @cache[id] = value
  get: (id) -> @cache[id]

