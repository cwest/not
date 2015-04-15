require 'rails_helper'
require 'pundit/rspec'

RSpec.describe OrganizationPolicy, type: :policy do
  let(:user) { Fabricate(:user) }
  subject { described_class }

  permissions '.scope' do
    subject { described_class::Scope.new(user, Organization) }
    let(:organizations) { Fabricate.times(5, :organization) }

    it 'returns all the organizations' do
      expect(subject.resolve).to match_array(organizations)
    end
  end

  permissions :show?, :index? do
    it 'lets anyone see organizations' do
      expect(subject).to permit(nil, Fabricate(:organization))
    end
  end

  permissions :new?, :create? do
    it 'lets anyone logged in create organizations' do
      expect(subject).to permit(user, Organization.new)
    end

    it 'denies anonymous creation of organizations' do
      expect(subject).to_not permit(nil, Organization.new)
    end
  end

  permissions :edit?, :update?, :destroy? do
    let(:owned_organization) do
      Fabricate(:organization_user,
                user: user,
                organization_role: Fabricate(:organization_role_owner)
               ).organization
    end
    let(:not_owned_organization) { Fabricate(:organization_user).organization }

    it 'lets owners manage organizations' do
      expect(subject).to permit(user, owned_organization)
    end

    it 'denies non-owners the ability to manage organizations' do
      expect(subject).to_not permit(user, not_owned_organization)
    end
  end
end
