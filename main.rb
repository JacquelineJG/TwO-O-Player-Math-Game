require "./players"
require "./questions"

@player_1 = Players.new("player_1", 3)
@player_2 = Players.new("player_2", 3)
# Can change turns by incrementing rounds by 1 and using % operator
@round = 0

def game_run
  @round += 1
  while !no_lives?
    if @round % 2 != 0
      questions = Questions.new
      if (@round != 1)
        puts '----- NEW TURN -----'
      end
      puts "Player 1: #{questions.question}"
      print 'answer: '
      answer = gets.chomp
      # note for future me, game does not understand math without the .to_i. Very funny
      if answer.to_i == questions.answer
        puts 'Player 1: Correct answer!'
        puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"       
      else 
        @player_1.lives -= 1
        puts 'Player 1: Incorrect answer!'
        puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
      end
      game_run
    elsif @round % 2 == 0
      questions = Questions.new
      if (@round != 1)
        puts '----- NEW TURN -----'
      end
      puts "Player 2: #{questions.question}"
      print 'answer: '
      answer = gets.chomp
      # note for future me, game does not understand math without the .to_i. Very funny
      if answer.to_i == questions.answer
        puts 'Player 2: Correct answer!'
        puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"       
      else 
        @player_2.lives -= 1
        puts 'Player 2: Incorrect answer!'
        puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
      end
      game_run
    end
  end
end

def no_lives?

  if @player_1.lives <= 0
    @player_1.dead = true
  end
  if @player_2.lives <= 0
    @player_2.dead = true
  end
  if @player_1.dead || @player_2.dead
    true
  else
    false
  end
end

game_run
puts 'Game over, no more lives. Thanks for playing!'