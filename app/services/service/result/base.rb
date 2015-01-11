module Service
  module Result
    class Base
      attr_reader :service

      def initialize(options = {})
        @service = options[:service]
      end

      def success?
        false
      end

      def success
        yield(service) if success?
      end

      def error?
        false
      end

      def error
        yield(service) if error?
      end
    end
  end
end
