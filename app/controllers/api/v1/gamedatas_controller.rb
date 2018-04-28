module Api::V1
	class GamedatasController < ApplicationController
		skip_before_action :verify_authenticity_token
		def index
			@guesses = guess_params
			p guess_params
			render json: @guesses
		end

		def update
			@guess = guess_params[:guess]
			p guess_params
			render json: guess_params if @guess.nil?

		end

		private

		def guess_params
			params
		end
	end
end