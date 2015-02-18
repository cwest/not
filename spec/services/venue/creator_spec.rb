require 'rails_helper'

RSpec.describe Venue::Creator, type: :service do
  let(:user) { Fabricate(:user) }
  let(:venue_params) { Fabricate.to_params(:venue, organization: nil) }
  let(:service) { described_class.new(options) }
  subject { service.perform }

  context 'When creating a venue' do
    let(:options) { { user: user, params: venue_params } }

    it 'returns a venue' do
      expect(subject).to be_an_instance_of(Venue)
    end

    it 'creates a default amount of taps' do
      expect(subject.venue_taps.length).to eq(described_class::DEFAULT_NUMBER_OF_TAPS)
    end
  end

  context 'When setting the number of taps' do
    let(:number_of_taps) { 30 }
    let(:options) { { user: user, params: venue_params, taps: number_of_taps } }

    it 'creates a specific amount of taps' do
      expect(subject.venue_taps.length).to eq(number_of_taps)
    end
  end

  context 'When there is missing information' do
    let(:options) { { user: user } }

    it "doesn't to create a venue" do
      expect(subject).to be(nil)
    end
  end
end
