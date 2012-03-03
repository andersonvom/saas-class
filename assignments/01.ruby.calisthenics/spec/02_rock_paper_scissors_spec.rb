require '02_rock_paper_scissors'


describe "RPS" do

  before :each do
    @hands = [
      ["Armando", "P"],
      ["Dave", "S"],
      ["Richard", "R"],
      ["Michael", "S"],
      ["Allen", "S"],
      ["Omer", "P"],
      ["David E.", "R"],
      ["Richard X.", "P"],
    ]
    @invalid_hand = ["Invalid", "X"]

    @tournament = [
      [
        [@hands[0], @hands[1]],
        [@hands[2], @hands[3]],
      ],
      [
        [@hands[4], @hands[5]],
        [@hands[6], @hands[7]],
      ],
    ]
  end

  describe "During game:" do

    it "should raise error if number of players is not 2" do
      lambda {rps_game_winner([@hands[0]])}.should raise_error WrongNumberOfPlayersError
      lambda {rps_game_winner([@hands[0], @hands[1]])}.should_not raise_error WrongNumberOfPlayersError
      lambda {rps_game_winner([@hands[0], @hands[1], @hands[2]])}.should raise_error WrongNumberOfPlayersError
    end

    it "should raise error if player if not going with Rock, Paper or Scissors" do
      lambda {rps_game_winner([@hands[0], @invalid_hand])}.should raise_error NoSuchStrategyError
      lambda {rps_game_winner([@invalid_hand, @hands[0]])}.should raise_error NoSuchStrategyError
      lambda {rps_game_winner([@hands[0], @hands[1]])}.should_not raise_error NoSuchStrategyError
    end

    it "should let the first player win if they go with same strategy" do
      rps_game_winner([@hands[0], @hands[5]]).should == @hands[0]
      rps_game_winner([@hands[5], @hands[0]]).should == @hands[5]
    end

    it "should return the winning player and strategy" do
      rps_game_winner([@hands[0], @hands[1]]).should == @hands[1]
      rps_game_winner([@hands[0], @hands[2]]).should == @hands[0]
      rps_game_winner([@hands[1], @hands[2]]).should == @hands[2]
    end

  end

  describe "During Tournament:" do

    it "should play all games and return one single winner" do
      rps_tournament_winner(@tournament).should == @hands[2]
    end

  end

end
