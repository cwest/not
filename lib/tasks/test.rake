Rake::Task['test:all'].clear
Rake::Task['test:all:db'].clear
Rake::Task['test:db'].clear
Rake::Task['test'].clear

namespace :test do
  task default: :all

  desc 'Run all tests'
  task all: :environment do
    Rake::Task['bundle_audit'].invoke
    Rake::Task['brakeman:run'].invoke
    Rake::Task['rubocop'].invoke
    Rake::Task['spec'].invoke
  end
end

task :test do
  Rake::Task['test:all'].invoke
end

task default: :test
