module FlashHelpers
  def flash_message(type)
    expect(page).to have_selector('.flash .label', text: type)
  end
end

World(FlashHelpers)
