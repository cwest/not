require 'rails_helper'

RSpec.describe KegVolume, type: :model do
  subject { Fabricate(:keg_volume) }

  it 'creates a keg volume' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
