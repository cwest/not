require 'rails_helper'

RSpec.describe Service::Base do
  let(:user) { Fabricate(:user) }

  context 'creating a new service object' do
    it 'requires a user' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end

  context 'executing the service' do
    subject { described_class.new(user: user) }

    it 'does not perform an action on its own' do
      expect { subject.call }.to raise_error
    end
  end

  context 'success' do
    let(:service) do
      Class.new(described_class) do
        def perform
          true
        end
      end
    end
    subject { service.new(user: user) }

    it 'reports successful' do
      expect(Service::Result::Success).to receive(:new)
      subject.call {}
    end
  end

  context 'error' do
    let(:service) do
      Class.new(described_class) do
        def perform
          false
        end
      end
    end
    subject { service.new(user: user) }

    it 'reports error' do
      expect(Service::Result::Error).to receive(:new)
      subject.call {}
    end
  end
end
