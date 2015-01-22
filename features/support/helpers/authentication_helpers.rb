module AuthenticationHelpers
  def join
    visit new_join_path
    fill_in 'user_email', with: visitor[:email]
    fill_in 'user_password', with: visitor[:password]
    fill_in 'user_password_confirmation', with: visitor[:password]
    click_button 'Sign up'
  end

  def login(user_password = password)
    visit new_login_path
    fill_in 'user_email', with: current_user.email
    fill_in 'user_password', with: user_password
    click_button 'Log in'
  end

  def become_locked_out
    5.times { login(password.reverse) }
  end

  def logout
    visit logout_path
  end

  def forgot_password
    visit new_password_path
    fill_in 'user_email', with: current_user.email
    click_button 'Send me reset password instruction'
  end

  def reset_password
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Change my password'
  end

  def request_unlock_instructions
    visit new_unlock_path
    fill_in 'user_email', with: current_user.email
    click_button 'Resend unlock instructions'
  end
end

World(AuthenticationHelpers)
