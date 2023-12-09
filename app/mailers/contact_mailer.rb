class ContactMailer < ApplicationMailer
  default from: 'noreply@example.com'
  default to: 'admin@example.com'
  layout 'mailer'
  
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'], subject: '【HowHubからお問い合わせ】'
  end
end
