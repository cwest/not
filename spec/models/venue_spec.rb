require 'rails_helper'

RSpec.describe Venue, type: :model do
  subject { Fabricate(:venue) }

  it 'creates a venue' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
