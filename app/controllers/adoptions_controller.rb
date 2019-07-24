# frozen_string_literal: true

class AdoptionsController < ApplicationController
	
	def create
		@adoption = current_user.adoptions.create(adoption_params)
		respond_with(@adoption)
	end

	def destroy
		@adoption.destroy
		respond_with(@adoption)
	end

	private

	def adoption_params
		params.require(:adoption).permit(:pet_id)
	end
end