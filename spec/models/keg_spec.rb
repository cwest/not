require 'rails_helper'

RSpec.describe Keg, type: :model do
  subject { Fabricate(:keg) }

  it 'creates a keg' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
