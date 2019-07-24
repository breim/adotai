# frozen_string_literal: true

class ContactMailer < ApplicationMailer

  default from: 'contato@adotaai.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sended.subject
  #
  def sended(contact)
    @contact = contact
    mail({
        from: @contact.email,
        to: 'contato@adotaai.com',
        subject: "Novo e-mail enviado por #{@contact.name}"
         })
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.received.subject
  #
  def received(contact)
    @contact = contact
    mail({
        to: contact.email,
        subject: "#{@contact.name}, Recebemos seu e-mail com sucesso"
         })
  end
end
