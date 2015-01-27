SwitchUser.setup do |config|
  config.controller_guard = lambda do |_current_user, _request, _original_user|
    # TODO: We will want this in production for users who are staff.
    Rails.env.development?
  end

  config.view_guard = config.controller_guard
end
