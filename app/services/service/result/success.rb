module Service
  module Result
    class Success < Result::Base
      def success?
        true
      end
    end
  end
end
