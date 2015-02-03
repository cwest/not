namespace :jasmine_jquery do
  desc 'Update jasmine-jquery.js from latest.'
  task update: :environment do
    name        = 'jasmine-jquery.js'
    latest      = "https://raw.githubusercontent.com/velesin/jasmine-jquery/master/lib/#{name}"
    destination = 'spec/javascripts/helpers'
    cmd         = "curl -o #{destination}/#{name} #{latest}"
    puts cmd
    system cmd
  end
end
