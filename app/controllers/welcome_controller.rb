class WelcomeController < ApplicationController
  def index
  	@props = { name: "Stranger" }
  end
end
