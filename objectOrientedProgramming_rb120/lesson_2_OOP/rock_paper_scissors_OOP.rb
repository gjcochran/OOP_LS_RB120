=begin
  Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

##
nouns: player, move, rule
verbs: choose, compare

##
then pair nouns/verbs

##
=end

class Move
  VALUES = %w(rock paper scissors)

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    if rock?
      other_move.scissors? ? true : false
    elsif paper?
      other_move.rock? ? true : false
    else
      other_move.paper? ? true : false
    end
  end

  def <(other_move)
    if rock?
      other_move.paper? ? true : false
    elsif paper?
      other_move.scissors? ? true : false
    else
      other_move.rock? ? true : false
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts 'name?'
      n = gets.chomp
      break unless n.empty?
      'enter your name'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts 'choose rock, paper, or scissors:'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts 'invalid choice'
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(Al Phil Charlie Alexa).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome"
  end

  def display_goodbye_message
    puts "Thanks"
  end

  def display_winner
    puts "#{human.name} chose: #{human.move}"
    puts "#{computer.name} chose: #{computer.move}"

    if human.move > computer.move
      puts "#{human.name} won"
    elsif human.move < computer.move
      puts "#{computer.name} won"
    else
      puts 'tie game'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'play again? (y/n)' answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      puts 'must answer y or n'
    end

    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
