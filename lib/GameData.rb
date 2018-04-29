require 'net/http'
require 'uri'

class GameData
	attr_accessor :board, :props, :post

	def initialize
		@found = {"" => 0} # for ajax
		@board = board_gen()
		@r1, @r2, @r3, @r4 = @board
  		@props = { r1: @r1, r2: @r2, r3: @r3, r4: @r4 }
  		@post = { title:"test", content:"" }
		@errors=nil
  		#may not implement expiration, but still good to have for future extention 
  		@start_at = Time.now
  		@expire_at = @start_at + 1800
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
  		# check guess is already in found. O(1) with hash search
  		# if not check word can be found in current board. O(N*N*W*16)
  		if word.include?(' ')
  			@errors = "Invalid Input : Input contain whitespace."
  		elsif @found[word]
  			@errors = "Input is already in answers."
  		elsif word.length > 16
  			@errors = "Invalid Input : Max Input is 16 chars."
  		elsif !request_word_check(word)
  			@errors = "Invalid Input : Not found in dictionary."
  		elsif verify_guess(word)
  			@errors = nil
  			add_to_found(word)
  		end
  	end

  	private
  	# 2 step verify
  	# 1. check it is a word
  	# 2. check it can be exist in board
  	def verify_guess(word)
		return true


  	end


  	def request_word_check(word)
  		# return false if word.nil? word.empty?
		uri = URI.parse("https://od-api.oxforddictionaries.com:443/api/v1/inflections/en/" + word)
		request = Net::HTTP::Get.new(uri)
		request["Accept"] = "application/json"
		request["App_id"] = "90c93729"
		request["App_key"] = "6e6814d1186166bf4de5cbc9c2193566"

		req_options = {
		  use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
		  http.request(request)
		end
		response.code == "200" ? true : false
	end
  	#Add to found{} with score
  	def add_to_found(word)
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