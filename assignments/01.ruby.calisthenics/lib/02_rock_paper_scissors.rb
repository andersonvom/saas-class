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


# Returns true if an array if a player. False otherwise.
def rps_is_player?(arr)
  arr[0].kind_of? String
end


# Takes a tournament encoded as a bracketed array and returns the winner
# The array has to be well formed (that is, there are 2^n players,
# and each one participates in exactly one match per round).
# That is, a tournament is a game where each player is either a player
# or another tournament.
def rps_tournament_winner(tournament)
  return tournament if rps_is_player? tournament

  player_one = rps_tournament_winner(tournament[0])
  player_two = rps_tournament_winner(tournament[1])

  rps_game_winner([player_one, player_two])
end
