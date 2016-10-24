# Parent class for all mailers
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def local_time date_time
        date_time.localtime.to_formatted_s(:custom_long_ordinal)
    end
end
