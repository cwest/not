require 'rails_helper'

RSpec.describe OrganizationRole, type: :model do
  describe 'the owner role' do
    subject { described_class.owner }
    let(:owner) { Fabricate(:organization_role_owner) }

    it 'finds an owner' do
      expect(subject.name).to eq(owner.name)
    end
  end
end
