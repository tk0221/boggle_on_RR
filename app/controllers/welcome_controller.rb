class WelcomeController < ApplicationController

  def index
  	@r1, @r2, @r3, @r4 = board_gen() #{}"ABCD", "DEFG", "ABCD", "DEFG"
  	@props = { name: "Stranger", r1: @r1, r2: @r2, r3: @r3, r4: @r4 }

  end

  private 
  	def board_gen
  		return [rand_chars(),rand_chars(),rand_chars(),rand_chars()]
  	end

  	def rand_chars
  		(0...4).map { (65 + rand(26)).chr }.join
  	end
end
