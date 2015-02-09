require 'rails_helper'

RSpec.describe VenueTap, type: :model do
  subject { Fabricate(:venue_tap) }

  it 'creates a venue tap' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
