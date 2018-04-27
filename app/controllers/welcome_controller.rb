class WelcomeController < ApplicationController
  def index

  	@r1, @r2, @r3, @r4 = "ABCD", "DEFG", "ABCD", "DEFG"
  	@props = { name: "Stranger", r1: @r1, r2: @r2, r3: @r3, r4: @r4 }



  end
end
