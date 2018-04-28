class WelcomeController < ApplicationController
    skip_before_action :verify_authenticity_token

	require 'GameData'

	@@gdata ||= GameData.new

	def index
		@@gdata = GameData.new		
		@props = @@gdata.props
		@post = @@gdata.post

	end

	def update
		# @word_submitted = gdata_params[:id]

		@@gdata.check_guess(gdata_params[:id])
		

		gdata_params[:board] = @@gdata.get_board
		gdata_params[:found] = @@gdata.get_found
		# p @@gdata.get_found
		render json: gdata_params
	end

	private

	def gdata_params
		params
	end


end
