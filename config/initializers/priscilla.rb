unless Priscilla.nil?
  Priscilla.configure do |c|
    c.width = 80
    c.decorator = ':beer:  '
    c.presenter = lambda do |msg|
      if Rails.env.development?
        Rails.logger.debug "\n#{msg}\n"
      else
        # rubocop:disable Rails/Output
        puts
        puts msg
        puts
        # rubocop:enable Rails/Output
      end
    end
  end
end
