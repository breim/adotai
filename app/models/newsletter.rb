# frozen_string_literal: true

class Newsletter < ApplicationRecord
  include MailerInterfaceable

  self.table_name  = 'newsletters'
  self.primary_key = 'id'

  DEFAULT_PROVIDERS = %w{application blog}

  def cancel
    set_token
    set_status(true)
    set_signup_date
    save!
    send_email(NewsletterMailer, :signup, self, :deliver_now)
  end

  def cancel
    remove_token
    set_status(false)
    save!
    send_email(NewsletterMailer, :cancel, self, :deliver_now)
  end

end
