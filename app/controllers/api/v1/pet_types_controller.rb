# frozen_string_literal: true

module API
	module V1
		class PetTypesController < ApplicationController
			before_action :set_pet_type, only: [:show]

			def index
				pet_types = PetType.all
				render json: {data: pet_types, status: 200}
			end

			def show
				pet_races = @pet.pet_races
				render json: {data: pet_races, status: 200}
			end

			private

			def set_pet
				@pet = PetType.find(params[:id])
			end
		end
	end
end