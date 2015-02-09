require 'rails_helper'

RSpec.describe BeerStyle, type: :model do
  subject { Fabricate(:beer_style) }

  it 'creates a beer style' do
    expect(subject).to be_an_instance_of(described_class)
  end
end
