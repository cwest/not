Rails.application.config.generators do |g|
  g.test_framework      :rspec, fixture: true
  g.fixture_replacement :fabrication

  # We throw these away pretty often anyway.
  g.assets     = false
  g.helper     = false
  g.view_specs = false
end
