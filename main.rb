require './game'
require './player'


player1 = Player.new(1, "Player 1")
player2 = Player.new(2, "Player 2")
game1 = Game.new(1, player1, player2)
game1.play

