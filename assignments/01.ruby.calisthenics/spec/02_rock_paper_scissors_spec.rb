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

    @tournament1 = [
      [
        [@hands[0], @hands[1]],
        [@hands[2], @hands[3]],
      ],
      [
        [@hands[4], @hands[5]],
        [@hands[6], @hands[7]],
      ],
    ]

    @tournament2 = [
      @hands[7],
      [
        [@hands[0], @hands[1]],
        [@hands[2], @hands[3]],
      ],
    ]

    @tournament3 = [@tournament1, @tournament2]
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

    it "should identify whether an array is a player or a game" do
      rps_is_player?(@hands[0]).should be_true
      rps_is_player?([@hands[0], @hands[1]]).should be_false
      rps_is_player?(@tournament1).should be_false
      rps_is_player?(@tournament2).should be_false
    end

    it "should play all games and return one single winner" do
      rps_tournament_winner(@tournament1).should == @hands[2]
      rps_tournament_winner(@tournament2).should == @hands[7]
      rps_tournament_winner(@tournament3).should == @hands[7]
    end

  end

end
