# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :set_profile, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[edit update]
  respond_to    :html, :json, :js

  def show
    respond_with(@profile)
  end

  def edit
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit
  end
end
