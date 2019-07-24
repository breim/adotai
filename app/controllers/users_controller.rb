# frozen_string_literal: true

class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:edit, :update, :destroy]
	respond_to		:html, :json, :js

	def index
		@users = User.all
		respond_with(@users)
	end

	def edit
		respond_with(@user)
	end

	def update
		@user.update(user_params)
		respond_with(@user)
	end

	def destroy
		@user.destroy
		respond_with(@user)
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end