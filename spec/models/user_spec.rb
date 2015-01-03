require 'rails_helper'

RSpec.describe User, type: :model do
  subject { Fabricate(:user) }

  context 'Setting up a User' do
    it 'creates a new user programmatically' do
      expect(subject).to_not be_nil
    end

    it 'authenticates a user' do
      expect(described_class.find(subject.id).valid_password?(subject.password)).to be(true)
    end
  end

  context 'ActiveJob compatibility' do
    it 'routes devise notifications through ActiveJob' do
      expect(subject).to receive_message_chain(:devise_mailer, :send, :deliver_later)
      subject.send_devise_notification(anything)
    end
  end
end
