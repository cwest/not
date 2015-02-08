Rake::Task['test:all'].clear
Rake::Task['test:all:db'].clear
Rake::Task['test:db'].clear
Rake::Task['test'].clear
Rake::Task['default'].clear

# rubocop
CI = %w(
  environment:report
  test:prepare
  bundle_audit
  brakeman:run
  scss_lint
  coffeelint
  spec
  cucumber
  spec:javascript
  notes
  about
)

# FIXME: Something about jasmine-rails on Travis is failing only there.
DEVELOPMENT = %w(
  spec:javascript
)

namespace :test do
  task default: :all

  task :prepare do
    ENV['RACK_ENV'] = ENV['RAILS_ENV'] = 'test'
  end

  desc 'Run all tests'
  task all: [:environment, 'test:ci', 'test:development']

  desc 'Run all CI tests'
  task ci: :environment do
    CI.each do |task|
      pr "rake #{task}"
      Rake::Task[task].invoke
    end
  end

  desc 'Run all development tests'
  task development: :environment do
    DEVELOPMENT.each do |task|
      pr "rake #{task}"
      Rake::Task[task].invoke
    end
  end
end

task test: 'test:all'

task default: :test
