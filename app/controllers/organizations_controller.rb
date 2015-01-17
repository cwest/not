class OrganizationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  after_action :verify_policy_scoped, only: [:index, :show]
  after_action :verify_authorized

  def index
    authorize @organizations = organizations
  end

  def new
    authorize @form = form
  end

  def create
    authorize creator.form.model

    creator.call do |result|
      @form = result.service.form
      redirect_to @form   if result.success?
      render action: :new if result.error?
    end
  end

  def show
    authorize @organization = organization
  end

  private

  def organizations
    policy_scope(Organization)
  end

  def organization
    return Organization.new unless id
    policy_scope(Organization).find(id)
  end

  def form
    @_form ||= OrganizationForm.new(organization)
  end

  def creator
    @_creator ||= Organization::Creator.new(
      user:   current_user,
      params: params[:organization],
      form:   form
    )
  end
end
