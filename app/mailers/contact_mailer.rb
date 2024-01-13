class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to: ENV['GMAIL_ADDRESS'], subject: '【HowHubからお問い合わせ】'
  end
end
