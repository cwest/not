Rake::Task['test:all'].clear
Rake::Task['test:all:db'].clear
Rake::Task['test:db'].clear
Rake::Task['test'].clear
Rake::Task['default'].clear

CI = %w(
  test:prepare
  bundle_audit
  brakeman:run
  rubocop
  scss_lint
  coffeelint
  spec
  cucumber
  notes
)

# FIXME: Something about jasmine-rails on Travis is failing only there.
DEVELOPMENT = %w(
  spec:javascript
)

namespace :test do
  task default: :all

  task :prepare do
    ENV['RACK_ENV'] = ENV['RAILS_ENV'] = 'test'
    puts "RAILS_ENV=#{ENV['RAILS_ENV']}"
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
