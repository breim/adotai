# frozen_string_literal: true

# frozen_string_literal

module MailerInterfaceable
  include ActiveSupport::Concern

  def send_email(mailer, method, object, deliver_method = :deliver_now)
    mailer.send(method, object).send(deliver_method)
  end
end
