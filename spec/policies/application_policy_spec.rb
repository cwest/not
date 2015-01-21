require 'rails_helper'
require 'pundit/rspec'

RSpec.describe ApplicationPolicy, type: :policy do
  let(:user) { Fabricate(:user) }
  let(:application_scope) { described_class::Scope.new(user, User) }
  subject { described_class }

  permissions '.scope' do
    subject { application_scope }

    it 'resolves to the class by default' do
      expect(subject.resolve).to be(User)
    end
  end

  permissions :show? do
    it 'permits provided the requested record exists' do
      allow(Pundit).to receive(:policy_scope!).and_return(application_scope.resolve)
      expect(subject).to permit(user, user)
    end
  end

  permissions :new?, :create?, :edit?, :update?, :destroy?, :index? do
    it 'denies access' do
      expect(subject).to_not permit(user, user)
    end
  end
end
