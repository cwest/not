require 'rails_helper'

RSpec.describe Beer, type: :model do
  subject { Fabricate(:beer) }

  it 'creates a beer' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
