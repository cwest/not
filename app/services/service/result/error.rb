module Service
  module Result
    class Error < Result::Base
      def error?
        true
      end
    end
  end
end
