# frozen_string_literal: true

Rails.application.routes.draw do

	# Authentication
	# url => http://auth.adotaai.com
	# @implemented
  devise_for :users

	# API
	# url => http://api.adotaai.com
	# @implemented
	namespace :api, constraint: { subdomain: 'api' }, path: '/' do
		# return JSON end-point
		namespace :v1 do
			resources :states,    only: [:index, :show]
			resources :pet_types, only: [:index, :show]
		end
		# return XML end-point
		namespace :v2 do
			resources :states,    only: [:index, :show]
			resources :pet_types, only: [:index, :show]
		end
	end

	# Blog
	# url => http://blog.adotaai.com
	# @implemented
	scope :blog do
		resources :categories
		resources :posts, only: [:index, :show]
	end

	# Application
	# url => http://adotaai.com
	# @implemented	
	root to: 'home#index'
	resources :newsletters, only: [:create, :destroy]
  resources :contact, only: [:create]

	# Dashboard
	# url => http://dashboard.adotaai.com
	# @implemented
	scope :dashboard do
		resources :categories
    resources :pets
		resources :users
		resources :profile
	end
end
