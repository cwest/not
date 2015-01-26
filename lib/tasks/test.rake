Rake::Task['test:all'].clear
Rake::Task['test:all:db'].clear
Rake::Task['test:db'].clear
Rake::Task['test'].clear

namespace :test do
  task default: :all

  task :prepare do
    ENV['RACK_ENV'] = ENV['RAILS_ENV'] = 'test'
  end

  desc 'Run all tests'
  task all: :environment do
    %w(bundle_audit brakeman:run rubocop spec cucumber notes).each do |task|
      Rake::Task[task].invoke
    end
  end
end

task :test do
  Rake::Task['test:all'].invoke
end

task default: :test
