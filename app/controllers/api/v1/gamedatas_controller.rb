# module Api::V1
#     class GamedatasController < ApplicationController
#         skip_before_action :verify_authenticity_token
#         def index
#             @gdata = gdata_params
#             p gdata_params
#             render json: @guesses
#         end

#         def update
#             @gdata = gdata_params[:guess]

#             p gdata_params
#             render json: gdata_params if @gdata.nil?

#         end

#         private

#         def gdata_params
#             params
#         end
#     end
# end