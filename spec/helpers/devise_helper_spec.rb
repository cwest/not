require 'rails_helper'

RSpec.describe DeviseHelper, type: :helper do
  it 'returns login for new session path' do
    expect(helper.new_session_path).to eq(helper.login_path)
  end
end
