# frozen_string_literal: true

class PostsController < ApplicationController
	before_action :set_post, only: [:show]

	def index
		@search = Post.ransack(params[:id])
		@posts  = @search.result(distinct: true)
		respond_with(@posts)
	end

	def show
		respond_with(@post)
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end
end