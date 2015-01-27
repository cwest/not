require 'scss_lint/rake_task'

SCSSLint::RakeTask.new do |t|
  t.files = ['app/assets']
end
