class GameData
	attr_accessor :board, :props, :post

	def initialize
		@found = {}
		@board = board_gen()
		@r1, @r2, @r3, @r4 = @board #{}"ABCD", "DEFG", "ABCD", "DEFG"
  		@props = { r1: @r1, r2: @r2, r3: @r3, r4: @r4 }
  		@post = { title:"test", content:"" }
  	end

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def board_gen
		return [rand_chars(),rand_chars(),rand_chars(),rand_chars()]
	end

	def rand_chars
		(0...4).map { (65 + rand(26)).chr }.join
	end

	def guess_params
		params
	end
end