# frozen_string_literal: true

module API
  module V1
    class StatesController < ApplicationController
      before_action :set_state, only: [:show]

      def index
        states = State.all
        render json: { data: states }, status: 200
      end

      def show
        cities = @state.cities
        render json: { data: cities }, status: 200
      end

      private

      def set_state
        @state = State.find(params[:id])
      end
    end
  end
end
