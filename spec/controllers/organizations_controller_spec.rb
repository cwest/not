require 'rails_helper'
require 'support/devise'
require 'support/service_result'

RSpec.describe OrganizationsController, type: :controller do
  let(:current_user)      { Fabricate(:user) }

  before(:each) do
    sign_in current_user
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    let(:organization)      { Fabricate(:organization) }
    let(:organization_form) { OrganizationForm.new(organization) }
    let(:creator)           { instance_double('Organization::Creator', form: organization_form) }

    before(:each) do
      allow(Organization::Creator).to receive(:new).and_return(creator)
    end

    it 'redirects to an organization on success' do
      success_for creator

      post :create
      expect(response).to redirect_to(organization_path(organization.id))
    end

    it 'renders new on error' do
      error_for creator

      post :create
      expect(response).to render_template(:new)
    end
  end

  describe 'GET show' do
    let(:organization) { Fabricate(:organization) }

    it 'returns http success' do
      get :show, id: organization.id
      expect(response).to have_http_status(:success)
    end
  end
end
