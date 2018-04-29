class GameData
	attr_accessor :board, :props, :post

	def initialize
		@found = {"" => 0} # for ajax
		@board = board_gen()
		@r1, @r2, @r3, @r4 = @board
  		@props = { r1: @r1, r2: @r2, r3: @r3, r4: @r4 }
  		@post = { title:"test", content:"" }
  		@start_at = Time.now
  		@errors=nil
  	end

  	def errors
  		return @errors
  	end

  	def get_board
  		return @board
  	end

  	def get_found
  		return @found
  	end


  	def check_guess(word)
  		#preprocess
  		if @found[word]
  			@errors = "Input is already in answers."
  		elsif word == "zzz"
  			@errors = "Invalid Input."
  		else
  			@errors = nil
  			add_to_found(word)
  		end
  	end

  	private

  	def add_to_found(word)
  		#verify word
  		len = word.length
  		return if len <= 2
  		score = 0
  		if len == 3 or len == 4
  			score = 1
  		elsif len == 5
  			score = 2
  		elsif len == 6
  			score = 3
  		elsif len == 7
  			score = 5
  		else len >=8
  			score = 11
  		end
  		@found[word] = score
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