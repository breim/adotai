# frozen_string_literal: true

class Newsletter < ApplicationRecord
  include MailerInterfaceable

  self.table_name  = 'newsletters'
  self.primary_key = 'id'

  DEFAULT_PROVIDERS = %w[application blog].freeze

  validates :name,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 30 }

  validates :email,
            presence: true,
            uniqueness: false,
            allow_blank: false,
            length: { minimum: 3, maximum: 245 }

  validates :token,
            uniqueness: true

  validates :provider,
            inclusion: DEFAULT_PROVIDERS

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

  private

  def set_token
    self.token = SecureRandom.urlsafe_base64
  end

  def remove_token
    self.token = nil
  end

  def set_status(status = true)
    self.active = status
  end

  def set_signup_date(date = Date.today)
    self.signup_date = date
  end
end
