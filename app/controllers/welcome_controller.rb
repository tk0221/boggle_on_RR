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
		@@gdata.check_guess(gdata_params[:id].upcase!)
		
		gdata_params[:found] = @@gdata.get_found
		
		if @@gdata.errors.nil?
			render json: gdata_params
		else
			render :json => { :errors => @@gdata.errors }
		end
	end

	private

	def gdata_params
		params
	end


end
