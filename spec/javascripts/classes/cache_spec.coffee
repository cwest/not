#= require classes/cache

describe "Cache", ->
  beforeEach -> @cache = new App.Cache

  it "returns nothing for cache miss", ->
    expect(@cache.get('misssing')).toBe(undefined)

  it "returns a value for cache hit", ->
    @cache.set('id', 'value')
    expect(@cache.get('id')).toBe('value')
