namespace :environment do
  desc 'Generate a report about the environment'
  task report: :environment do
    env = ENV.map do |name, value|
      {
        name:  name,
        value: value
      }
    end
    tp env, :name, value: { width: 100 }
  end
end
