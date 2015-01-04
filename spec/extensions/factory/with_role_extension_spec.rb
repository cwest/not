require 'rails_helper'

RSpec.describe Factory::WithRoleExtension, type: :extension do
  context 'Build extension' do
    context 'Successful Build' do
      subject do
        described_class.build(
          mapping_association: :organization_user,
          role_association:    :organization_role
        )
      end

      it 'builds an extension' do
        expect(subject).to be_instance_of(Module)
      end
    end

    context 'Missing required options' do
      it 'fails without options' do
        expect { described_class.build }.to raise_error(ArgumentError)
      end

      it 'fails without :mapping_association method' do
        expect do
          described_class.build(role_association: :organization_role)
        end.to raise_error(ArgumentError)
      end

      it 'fails without :role_association method' do
        expect do
          described_class.build(mapping_association: :organization_user)
        end.to raise_error(ArgumentError)
      end
    end
  end
end
