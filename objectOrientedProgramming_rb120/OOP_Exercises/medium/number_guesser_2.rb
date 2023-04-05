
class GuessingGame
  def initialize(low_num, high_num)
    @range = low_num..high_num
    @number = Random.new.rand(@range)
    @count = Math.log2(size_range).to_i + 1
    @guess = nil
  end

  def play
    loop do
      display_remaining
      prompt
      display_result
      decrement
      puts ''
      break if @count.zero? || won?
    end
    goodbye
  end

  private

  attr_reader :number
  attr_accessor :count, :guess

  def size_range
    array = range_to_a
    array.max - array.min
  end

  def range_to_a
    @range.to_a
  end

  def display_remaining
    puts "You have #{count} guesses remaining."
  end

  def prompt
    text = "Enter a number between #{range_to_a.min} and #{range_to_a.max}: "
    puts text
    answer = nil

    loop do 
      answer = gets.chomp.to_i
      break if (@range).include?(answer)
      puts "Invalid guess. #{text}" 
    end
    @guess = answer
  end

  def display_result
    if low?
      puts "Your guess is too low."
    elsif high?
      puts "Your guess is too high."
    elsif won?
      puts "That's the number!"
    end
  end

  def won?
    @guess == @number
  end

  def low?
    @guess < @number
  end

  def high?
    @guess > @number    
  end

  def decrement
    @count -= 1
  end

  def goodbye
    if won?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
      puts "The number was #{@number}..."
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play

=begin
LS code for reference...

class GuessingGame
  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize(low, high)
    @range = low..high
    @max_guesses = Math.log2(high - low + 1).to_i + 1
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(@range)
  end

  def play_game
    result = nil
    @max_guesses.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      return guess if @range.cover?(guess)
      print "Invalid guess. "
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end
=end
