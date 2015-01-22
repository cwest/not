module Service
  class Base
    attr_reader :user

    def initialize(options = {})
      @user   = options.fetch(:user) do
        fail ArgumentError, 'Required argument `:user` missing.'
      end
    end

    def call(&block)
      result_for(block) { perform }
    end

    def perform
      fail "Must define the method perform in class #{self.class.name}!"
    end

    private

    def result_for(callback)
      result = yield
      callback.call(result ? success : error) if callback
      result
    end

    def success
      Result::Success.new(service: self)
    end

    def error
      Result::Error.new(service: self)
    end
  end
end
