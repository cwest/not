require 'rails_helper'

RSpec.describe OrganizationForm, type: :form do
  let(:organization) { Fabricate.build(:organization) }
  subject { described_class.new(organization) }

  it 'requires a name' do
    expect(subject.validate(name: nil)).to be(false)
  end
end
