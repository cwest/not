require 'rails_helper'

RSpec.describe User::Welcomer, type: :service do
  let(:user) { Fabricate(:user) }

  context 'Performs the action' do
    subject { described_class.new(user: user) }
    let(:mailer) { instance_double('UserRegistrationsMailer') }

    it 'returns a mailer object' do
      allow(subject).to receive(:send_welcome_email).and_return(true)
      expect(subject.perform).to be_an_instance_of(User)
    end

    it 'delivers the mail' do
      expect(UserRegistrationsMailer).to receive_message_chain(:welcome, :deliver_later)
      subject.perform
    end
  end
end
