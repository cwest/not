require 'rails_helper'

RSpec.describe PeekBar do
  subject { described_class }

  context 'without Peek' do
    before(:each) do
      Object.send(:remove_const, :Peek) if defined?(Peek)
    end

    it "isn't available" do
      expect(subject.available?).to be(false)
    end

    it "isn't enabled" do
      expect(subject.enabled?(anything)).to be(false)
    end
  end

  context 'with Peek' do
    before(:each) { Peek = Class.new }
    after(:each) { Object.send(:remove_const, :Peek) }

    it 'is available' do
      expect(subject.available?).to be(true)
    end

    it 'is enabled' do
      allow(Rails.env).to receive(:development?).and_return(true)
      expect(subject.enabled?(anything)).to be(true)
    end
  end
end
