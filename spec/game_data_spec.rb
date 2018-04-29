require "GameData"

describe GameData do
  game_data = GameData.new
  subject {GameData.new}
  describe "#RSpec test" do
    it "returns pass" do
      expect(nil).to be_nil
    end
  end

  describe "#GameData load" do
    it "returns game data correctly" do
      @gdata = GameData.new
      expect(@gdata).not_to be_nil
    end
  end

  describe "#GameData " do
    it "returns " do
      @gdata = GameData.new
    end
  end

  describe "#GameData defaults" do
    it "returns number of rows" do
      expect(subject.board.size).to eql(4)
    end
    it "returns score of default which is 0" do
     expect(subject.get_found.values).to eql([0])
    end
    it "returns random chars" do
      expect(subject.send(:rand_chars).size).to eql(4)
    end
    it "returns board_gen()" do
      expect(subject.send(:board_gen).size).to eql(4)
    end
  end

  describe "#GameData path_check" do
    it "returns true when [0,0] is adjacency with [0,1]" do
      @gdata = GameData.new
      expect(@gdata.send(:path_check, [[0,0],[0,1]])).to be true
    end
    it "returns true when [0,0] is adjacency with [1,1]" do
      @gdata = GameData.new
      expect(@gdata.send(:path_check, [[0,0],[1,1],[2,2],[3,3]])).to be true
    end
    it "returns true when U shape" do
      @gdata = GameData.new
      expect(@gdata.send(:path_check, [[0,0],[1,0],[2,0],[3,0],[3,1],[2,1],[1,1],[0,1]])).to be true
    end
    it "returns false when [0,0] is not adjacency with [0,2]" do
      @gdata = GameData.new
      expect(@gdata.send(:path_check, [[0,0],[0,2]])).not_to be true
    end
  end

  describe "#GameData oxford dict" do
    it "returns true when apple is a word" do
      @gdata = GameData.new
      expect(@gdata.send(:request_word_check, "apple")).to be true
    end
    it "returns false when apple is a word" do
      @gdata = GameData.new
      expect(@gdata.send(:request_word_check, "itsNotAWord")).to be false
    end
  end

  



end