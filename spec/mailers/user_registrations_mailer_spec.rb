require 'rails_helper'

RSpec.describe UserRegistrationsMailer, type: :mailer do
  describe 'welcome' do
    let(:user) { Fabricate(:user) }
    let(:mail) { described_class.welcome(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome')
      expect(mail.to).to match_array([user.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(user.email)
    end
  end
end
