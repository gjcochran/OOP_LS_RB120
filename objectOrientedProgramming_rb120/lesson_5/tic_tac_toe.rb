=begin
--- this is my attempt of creating OO version of game before looking at any LS materials/guidance
   - did reference RPS game

game description:
- given a 3x3 board (ie 9 available square)
- 2 players alternate turns
- each player assigned either X or O (opposite of other)
- each turn can place their symbol (ie X/O) on one empty square
- turns alternate until... (2 options)
  1. all 9 squares are filled
  2. a player has 3 consecutive symbols on the board
    - consecutive can be horizontal, vertical, or diagonal

what are potential verbs/nouns to determine methods/classes??

nouns:
- player
- board
- symbol / team

verbs:
- place piece / turn

extra: 
- determine winner
- have a game play class
  - series of methods that run in order that will execute game in order

##
PEDAC

- how to set up board?
  - could do array of arrays 3x3
  - each of 9 elements originally set to ..?
    - could set each to a number so that is easy for user to choose
  - on each turn, provide a representation of board to the user
    - board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      - have all els be strings 
    - board.each { |sub| p sub }
  - then get a number from them. if board includes that number
- how to determine who goes first?
- how to choose X or O?
- how to evaluate winner after each iteration

assume:
- playing against computer
=end
module SetUp
  def board_reset
    @@board = [%w(1 2 3), %w(4 5 6), %w(7 8 9)]
  end

  @@teams = {X: nil, O: nil}

  def display_board
    puts "Tic Tac Toe game board:"
    new_line
    @@board.each { |line| p line }
  end

  def new_line
    puts "\n\n"
  end
end

class Player
  include SetUp

  attr_accessor :name, :available

  def initialize
    set_name
  end

  def open_board
    @@board.flatten.reject { |square| square == :X || square == :O }
  end

end

class Move
  include SetUp
  # not sure how to use, once refactor...
end

class Human < Player
  attr_accessor :coin

  def initialize
    super
    piece
    @coin = %w(h t)
#    @first = flip_for_first?
  end

  def set_name
    puts "what is your name?"
    self.name = gets.chomp.capitalize
    new_line
  end

  def piece
    puts "Would you prefer team X or team O?" 
    loop do
      team = gets.chomp.upcase.to_sym
      if @@teams.keys.include?(team)
        @@teams[team] = self.object_id
        break
      else
        puts "Please choose X or O"
      end
    end
    new_line
  end

  def flip_for_first?
    puts "We'll flip a coin to decide who goes first..."
    puts "Heads or tails?"
    choice = ''
    loop do
      choice = gets.chomp.chr.downcase
      coin.include?(choice) ? break : (puts 'Not valid choice')
    end
    flip = coin.sample
    flip == 'h' ? (puts "\nHeads was flipped") : (puts "\nTails was flipped")
    choice == flip
  end

  def choose
    available = open_board
    puts "Available squares: #{available} \n\n"
    puts "Next move?"
    choice = ''
    loop do
      choice = gets.chomp
      available.include?(choice) ? break : (puts 'Invalid Option')
    end
    puts "You chose: #{choice} \n\n"
    choice
  end
end

class Computer < Player
  def initialize
    super
    assign_piece
  end

  def set_name
    self.name = 'AI Bot'
  end

  def assign_piece
    @@teams[:X].nil? ? @@teams[:X] = self.object_id : @@teams[:O] = self.object_id
  end

  def choose
    available = open_board
    choice = available.sample
    puts "Computer chose: #{choice} \n\n"
    choice
  end
end


class TTTGame 
  include SetUp

  @@winner = false

  attr_accessor :human, :computer, :first_player, :second_player, :current_player

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def greet_player
    puts "Welcome #{human.name.capitalize}. You will be playing with #{@@teams.key(human.object_id)} pieces."
  end
  
  def game_info
    who_goes_first
    puts "\nHere's how this game works..."
    puts "We will alternate turns, starting with #{first_player.name}"
    puts "\nEach turn you will choose a square on the 3x3 board which is not yet chosen"
    puts "Available squares contain the number of that square placement on the board"
    new_line
    puts "First player to get 3 of their pieces in a row win!"
    puts "If neither player has 3 in the row after the board is filled, it's a draw \n\n"
  end

  def who_goes_first
    if human.flip_for_first? == true 
      @first_player = @human
      @second_player = @computer
    else
      @first_player = @computer
      @second_player = @human
    end
    @current_player = @first_player
  end

  def switch_player(player)
    if player == @first_player 
      @current_player = @second_player
    else
      @current_player = @first_player
    end
  end

  def update_board(square)
    @@board.each do |line|
      if line.include?(square)
        o_idx = @@board.index(line)
        i_idx = line.index(square)
        @@board[o_idx][i_idx] = @@teams.key(@current_player.object_id)
      end
    end
  end

  def horizontal?
    @@board.each do |line| 
      winning_piece = line.uniq.first
      if (line.uniq.size == 1) && (winning_piece == @@teams.key(@human.object_id)) 
        @@winner = true
        return true
      elsif line.uniq.size == 1
        return true
      end
    end
    false
  end


  def vertical?
    @@board.transpose.each do |line| 
      winning_piece = line.uniq.first
      if (line.uniq.size == 1) && (winning_piece == @@teams.key(@human.object_id)) 
        @@winner = true
        return true
      elsif line.uniq.size == 1
        return true
      end
    end
    false
  end

  def diagonal?
    upper_left = @@board[0][0]
    middle = @@board[1][1]
    lower_right = @@board[2][2] 
    lower_left = @@board[2][0]
    upper_right = @@board[0][2] 

    down_diagonal = [upper_left, middle, lower_right]
    up_diagonal = [lower_left, middle, upper_right]


    if (down_diagonal.uniq.size == 1) && (down_diagonal.uniq.first == @@teams.key(@human.object_id)) 
      @@winner = true
      return true
    elsif (up_diagonal.uniq.size == 1) && (up_diagonal.uniq.first == @@teams.key(@human.object_id)) 
      @@winner = true
      return true
    elsif down_diagonal.uniq.size == 1
      return true
    elsif up_diagonal.uniq.size == 1
      return true
    end

    false
  end

  def evaluate_board?
    horizontal? || vertical? || diagonal? 
  end

  def display_winner
    if @@winner
      puts "Congrats! You won!"
    else
      puts "Sorry, better luck next time."
    end
  end

  def tie
    puts "It's a draw!"
  end

  def play_again?
    puts "\n#{human.name} - Would you like to play again?"
    choice = gets.chomp.chr.downcase
    choice == 'y'
  end

  def display_goodbye
    puts "\nThanks for playing!"
  end

  def play
    greet_player
    loop do
      board_reset
      game_info
      display_board

      turns_available = 9
      loop do
        update_board(current_player.choose)
        display_board
        new_line
        if evaluate_board?
          display_winner
          break
        end

        switch_player(current_player)
        turns_available -= 1
        if turns_available == 0
          tie
          break 
        end
      end

      break unless play_again?
    end
    display_goodbye
  end
  
end

TTTGame.new.play
