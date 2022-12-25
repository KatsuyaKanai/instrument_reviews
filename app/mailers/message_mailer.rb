class MessageMailer < ApplicationMailer
  default to: Rails.application.credentials.g_mail[:g_mail]

  def received_email(message)
    @message = message
    mail(subject: 'webサイトよりメッセージが届きました') do |format|
      format.text
    end
  end
end
