require 'rails_helper'

RSpec.describe UserRegistrationsController, type: :controller do
  let(:current_user) { Fabricate.build(:user) }

  describe 'POST create' do
    let(:welcomer) { instance_double('User::Welcomer') }

    before(:each) do
      allow(User::Welcomer).to receive(:new).and_return(welcomer)
    end

    it 'calls the welcomer service on sign_up' do
      expect(welcomer).to receive(:call)
      controller.sign_up(:user, current_user)
    end
  end
end
