module TestHelper
  module ServiceResult
    def success_for(service)
      allow(service).to receive(:call).and_yield(success(service))
    end

    def error_for(service)
      allow(service).to receive(:call).and_yield(error(service))
    end

    private

    def success(service)
      Service::Result::Success.new(service: service)
    end

    def error(service)
      Service::Result::Error.new(service: service)
    end
  end
end
