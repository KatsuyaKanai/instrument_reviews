class MessageMailer < ApplicationMailer
  default to: ENV['ACTION_MAILER_USER']

  def received_email(message)
    @message = message
    mail(subject: 'webサイトよりメッセージが届きました') do |format|
      format.text
    end
  end
end
