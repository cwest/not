require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  it 'returns the id parameter on the request' do
    controller.params[:id] = '1'
    expect(controller.send(:id)).to eq('1')
  end
end
