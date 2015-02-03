describe "visibility", ->
  beforeEach ->
    @target = affix '#visibility'
    @toggle = affix 'a[data-visibility="#visibility"][href="#"]'

    @target.text "Target"
    @toggle.text "Toggle"

  it 'toggles from hidden to shown', (done) ->
    @target.one 'visibility:hidden', =>
      expect(@target).toBeHidden()
      @toggle.click()
    @target.one 'visibility:shown', =>
      expect(@target).toBeVisible()
      done()
    @toggle.click()
