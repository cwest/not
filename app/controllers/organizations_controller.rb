class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @form = form
  end

  def create
    creator.call do |result|
      @form = result.service.form
      redirect_to @form   if result.success?
      render action: :new if result.error?
    end
  end

  def show
    @organization = organization
  end

  private

  def organization
    return Organization.new unless id
    Organization.find(id)
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
