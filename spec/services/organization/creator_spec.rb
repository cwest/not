require 'rails_helper'

RSpec.describe Organization::Creator, type: :service do
  let(:user) { Fabricate(:user) }

  context 'Create the service' do
    subject { described_class.new(user: user) }

    it 'creates a service object' do
      expect(subject).to be_an_instance_of(described_class)
    end
  end

  context 'Performs the action' do
    let(:params) { Fabricate.to_params(:organization) }
    subject { described_class.new(user: user, params: params) }

    it 'returns an organization' do
      expect(subject.perform).to be_an_instance_of(Organization)
    end

    it 'associates the organization with the user' do
      expect(subject.perform.users.owner).to include(user)
    end
  end
end
