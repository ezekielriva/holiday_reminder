class ClientMailer < ActionMailer::Base
  default from: 'holiday@reminder.com'

  def reminder_email(client, holiday)
    @client = client
    @holiday = holiday
    mail(to:@client.email, subject: 'Holiday reminder')
  end
end
