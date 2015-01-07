require 'rails_helper'

RSpec.describe PeekBarHelper, type: :helper do
  before(:each) { allow(helper).to receive(:current_user).and_return(anything) }

  it 'is not enabled' do
    allow(PeekBar).to receive(:enabled?).and_return(false)
    expect(helper.peek_enabled?).to be(false)
  end

  it 'is enabled' do
    allow(PeekBar).to receive(:enabled?).and_return(true)
    expect(helper.peek_enabled?).to be(true)
  end
end
