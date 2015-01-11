require 'support/test_helper/service_result'

RSpec.configure do |config|
  config.include TestHelper::ServiceResult, type: :controller
end
