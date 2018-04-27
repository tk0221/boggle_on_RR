module Api::V1
	class GuessesController < ApplicationController
		def index
			@guesses = guess_params
			render json: @guesses
		end

		def update
			@guess = guess_params[:guess]

			render json: guess_params if @guess.nil?

		end

		private

		def guess_params
			params
		end
	end
end