# frozen_string_literal: true

class NewsletterMailer < ApplicationMailer
  default from: 'no-reply@adotaai.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.signup.subject
  #
  def signup(newsletter)
    @newsletter = newsletter
    mail(
      to: @newsletter.email,
      subject: "#{@newsletter.name}, Você se inscreveu com sucesso."
    )
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.cancel.subject
  #
  def cancel(newsletter)
    @newsletter = newsletter
    mail(
      to: @newsletter.email,
      subject: "#{@newsletter.name}, que pena, espero te-lo conosco novamente."
    )
  end
end
