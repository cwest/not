Rake::Task['test:all'].clear
Rake::Task['test:all:db'].clear
Rake::Task['test:db'].clear
Rake::Task['test'].clear

namespace :test do
  task default: :all

  desc 'Run all tests'
  task all: :environment do
    Rake::Task['rubocop'].invoke
    Rake::Task['spec'].invoke
  end
end

desc 'Run all tests'
task :test do
  Rake::Task['test:all'].invoke
end

task default: :test
