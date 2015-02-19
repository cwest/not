class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def mail(*args)
    super(*args) do |format|
      format.text
      format.html
    end
  end
end
