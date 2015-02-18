class Venue
  class Creator < Service::Base
    DEFAULT_NUMBER_OF_TAPS = 5

    attr_reader :params, :form, :taps

    def initialize(options = {})
      super
      @params       = options[:params] || {}
      @form         = options[:form]   || VenueForm.new(Venue.new)
      @taps         = options[:taps]   || DEFAULT_NUMBER_OF_TAPS
      @organization = options[:organization]
    end

    def perform
      return unless form.validate(params_with_organization) && form.save

      form.model.tap do |venue|
        add_taps_to(venue)
      end
    end

    private

    def add_taps_to(venue)
      taps.times do |number|
        venue.venue_taps.create(number: number)
      end
    end

    def params_with_organization
      params.merge(organization_id: organization.try(:id))
    end

    def organization
      @organization || create_organization
    end

    def create_organization
      Organization::Creator.new(user: user, params: params).call
    end
  end
end
