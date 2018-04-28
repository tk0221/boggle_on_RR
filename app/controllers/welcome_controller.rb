class WelcomeController < ApplicationController

	require 'GameData'

	def index
		@gdata = GameData.new
		@props = @gdata.props
		@post = @gdata.post
	end

	def update
		@word_submitted = guess_params[:id]
		p guess_params

		render json: guess_params
	end

	private

	def guess_params
		params
	end


end
