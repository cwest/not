class Organization
  class Creator < Service::Base
    attr_reader :params, :form

    def initialize(options = {})
      super
      @params = options[:params] || {}
      @form   = options[:form] || OrganizationForm.new(Organization.new)
    end

    def perform
      return unless form.validate(params) && form.save

      form.model.tap do |organization|
        organization.organization_users.create(
          user:              user,
          organization_role: OrganizationRole.owner
        )
      end
    end
  end
end
