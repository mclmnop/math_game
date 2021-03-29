=begin  
class player:
init => name, number, score =3
methods => add point, substract point
 ask question(game.question)
 check if answer right(otherplayer.answer)
 right answer reply
 wrong answer reply

class game
  init => id, players
  methods -=> get current player with score
  create math question with answer
  check if answer ok
  modify score, send player reply

  diagram https://app.diagrams.net/#G1f6vCi38Bzdc4qbZ9vGsoA3Elb4u31DXm
=end


class Player
  attr_accessor :name, :score

  def initialize(id, name)
    @id = id
    @name = name
    @score = 3
    @currently_asking = false
    @currently_answering = false
  end
end

class Game
  attr_accessor :player_asking, :player_answering, :good_answer
  @@good_answer = 0
  def initialize(gameId, player1, player2)
    @id = gameId
    @player1 = player1
    @player2 = player2
    @player_asking = player1
    @player_answering = player2
  end

  def get_score
    if (@player1.score == 0) 
      puts "#{@player2.name} wins!!"
    elsif (@player2.score == 0) 
      puts "#{@player1.name} wins!!"
    else
      temp_player = player_asking
      player_asking = player_answering
      player_answering = temp_player
      "#{@player1.name} score >> #{@player1.score} vs #{@player2.name} score >> #{@player2.score}"
    end
  end

  def switch_roles(player_asking, player_answering)
    temp_player = @player_asking
    @player_asking = @player_answering
    @player_answering = temp_player
  end

  def get_roles
    "#{player_answering.name} is currently answering and  #{player_asking.name} is currently asking"
  end

  def askQuestion
    num1 = rand(1..20)
    num2 = rand(1..20)
    good_answer = num1 + num2

    puts "#{player_asking.name}: What does #{num1} + #{num2}"
    player_answer = gets.chomp.to_i

    if (player_answer != good_answer)
      player_answering.score -= 1
      "#{player_asking.name}: Seriously? No!"
    else
      "#{player_asking.name}: Yes! You are correct"
    end
  end

  def play
    while @player1.score > 0 && @player2.score > 0
      puts askQuestion()
      switch_roles(player_asking, player_answering)
      puts get_score()
    end
  end

end

player1 = Player.new(1, "Player 1")
player2 = Player.new(2, "Player 2")
game1 = Game.new(1, player1, player2)
puts game1.play

