require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { Fabricate(:organization) }
  context 'Users' do
    let(:organization_user) { Fabricate(:organization_user, organization: subject) }

    it 'finds users given a valid role' do
      role = organization_user.organization_role
      user = organization_user.user

      expect(subject.users.with_role(role.name)).to contain_exactly(user)
    end
  end
end
