class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

STRATEGIES = {"R" => "S", "P" => "R", "S" => "P"}

# return the name and strategy of the winning player. If both players
# use the same strategy, the first player is the winner.
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless STRATEGIES.keys.include? game[0][1] and STRATEGIES.keys.include? game[1][1]

  game[0][1] == STRATEGIES[game[1][1]] ? game[1] : game[0]
end

