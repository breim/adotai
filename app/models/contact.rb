# frozen_string_literal: true

class Contact < Object
	include ActiveModel::Conversion
	include ActiveModel::Validations

	def initialize(params = {})
		@name    = params[:name]
		@email   = params[:email]
		@phone   = params[:phone]
		@subject = params[:subject]
		@message = params[:message]
	end

	def persisted?
		false
	end

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

	validates :phone,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 35 }

	validates :subject,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 75 }

	validates :message,
						presence: true,
						uniqueness: false,
						allow_blank: false,
						length: { minimum: 3, maximum: 4_000 }
end