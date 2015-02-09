require 'rails_helper'

RSpec.describe Brewery, type: :model do
  subject { Fabricate(:brewery) }

  it 'creates a brewery' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
