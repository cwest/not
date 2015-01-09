require 'rails_helper'

RSpec.describe Service::Result::Base do
  subject { described_class.new(service: anything) }

  context 'success' do
    it 'returns false for success' do
      expect(subject.success?).to be(false)
    end

    it 'does not execute anything' do
      expect(subject.success {}).to be(nil)
    end
  end

  context 'failure' do
    it 'returns false for error' do
      expect(subject.error?).to be(false)
    end

    it 'does not execute anything' do
      expect(subject.error {}).to be(nil)
    end
  end
end
