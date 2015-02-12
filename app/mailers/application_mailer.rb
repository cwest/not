class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def mail(*args, &block)
    if block_given?
      super
    else
      super(*args) do |format|
        format.text
        format.html
      end
    end
  end
end
