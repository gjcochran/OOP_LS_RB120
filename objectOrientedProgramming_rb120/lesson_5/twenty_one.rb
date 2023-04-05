require 'pry'
=begin
# my attempt to solve this without referencing RB101 version + before watching LS implementation of OO version
# will
#  1. copy their game description
#  2. reference their OO implementation of tic tac toe

game description:
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.

nouns:
 - dealer
 - player
 - card
 - deck
 - hand
 
verbs:
 - deal
 - hit
 - stay
 - bust

Deck (incl card(s))
Hand

Player(s)
 - hit
 - stand (ie stay)
 - bust
 Dealer
  - deal
 Player

thoughts: 
 - how to integrate $$ and betting into this game?
   - i think ask player how much they want to come to table with (give range up to $1,000)
   - establish minimum round bet of let's say $10 and max $500
   => betting rules
     - if player wins, receive 1.5 times bet
     - if both player and dealer get 21 in first deal, receive money back
     - if dealer wins, player loses bet
 - all dealt cards are random from shuffled deck
 - should dealer always stay once at 17 or more?
   - verified that this is a rule
 - most often 6 decks are used in a casino... build to handle multiple decks??
  - only use one deck
 - game can accomodate more than one player .. build to handle multiple players at table??
 - do rules about cards being "face up" matter for my purposes?
   - they might matter only in regards to player not knowing what dealers cards are...
   - going to ignore this as dealers card is flipped up after inital deal anyway..
 - if players first two cards are the same, player may choose to split into two hands (placing same bet on second hand...)
   - should i implement this?
 - there is a double down rule... when original two cards equal 9 10 or 11, player may double down but can only receive one more card...

rules:
 - jack, king, queen are all worth 10 pts
 - ace is worth either 1 or 11 pts, players discretion
 - no limits to how many cards take, round over when all players happy with number of cards received
   - i think is just alternating until someone says stay
 - if go over 21, must declare bust to other players/dealer
 - dealer inital deal...
   - one card to each player face up
   - one card to dealer face up
   - second card to each player face up
   - second card to dealer face down

game play breakdown:
1. welcome online player
  a. ask for name
  b. explain rules of game
  c - optional ... ask for $$ that player is betting

2. initial deal
  a. player dealt two cards from deck 
  b. dealer dealt two cards from deck
3. turns (ie each main round)
  a. display dealer and player cards to player
    - should i display sum of cards to player?
      - if so, account for ace?
    - how to display cards...?
      - think deck should be a hash of arrays
        - ie is 4 keys (each suit)  
          - w array of 13 suit cards as each hash value
        - can show cards represented in a box with string interpolation in middle..?
ie...
  ------------
  \          \
  \          \
  \    9     \
  \  HEARTS  \
  \          \
  \          \
  ------------
  b. ask if hit or stay
  c. if hit, then receive one random card
  d. if over 21, bust
  e. else, then deal to dealer (until at least 17)
  f. alternate turns
    - if dealer at >= 17, then only deal to player
    - also if player stays, then only deal to dealer until >= 17
 4. once both staying... 
  a. tally results
  b. display winner
  c. calculate new money total 
 5. ask if want to play another round
  a. if player has less than minimum bet remaining, request more money...
 6. say goodbye and output winnings
=end

module UI
  def output(message)
    puts ">> #{message}" 
  end

  def new_line
    puts ''
  end

  def clear
    system "clear"
  end
end

class Deck
  attr_accessor :cards

  SUIT_CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).zip([2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [1, 10]])
  SUITS = %i(clubs diamonds hearts spades)

  def initialize
    @cards = {}
    reset
  end

  def reset
    SUITS.each { |suit| @cards[suit] = SUIT_CARDS }
    @cards = @cards.map { |suit, value_arr| value_arr.map { |values| [suit, values] } }.flatten(1)
  end
end

class Player
  include UI

  attr_accessor :name, :starting_money, :money, :bet, :hand, :stand

  def initialize
    @name = name
    @starting_money = starting_money
    @bet = bet
    @hand = []
    @stand = false
  end

  ### how to reset player while keeping same name and money on play_again?

  def reset
    @bet = nil
    @hand = []
    @stand = false
  end

  def request_name
    output("What is your name?")
    answer = gets.chomp
    @name = answer.capitalize
    clear
  end

  def request_money
    output("Before you can sit down at the table... our minimum deposit to play is $100 (maximum is $1,000)")
    output("How much would you like to deposit, #{name}?")
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if (100..1000).include?(answer)
      output("Not a valid deposit...")
   end   
    @starting_money = answer
    @money = @starting_money
    clear
  end

  def display_money
    output("Money available: $#{@money.to_i}")
  end

  def round_bet
    output("How much would you like to bet on this round?")
    output("... minimum bet: $20; maximum bet: $500")
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if (20..500).include?(answer) && @money >= answer
      output("Not enough money in account...") if @money < answer
      output("Invalid bet") if (20..500).include?(answer) == false
    end
    @bet = answer
  end

  def display_hand
    @hand.each do |card|
      display_card(card)
    end
  end

  def sum
    sum_low = @hand.map do |card|
      value = card.last.last 
      if value.is_a?(Array)
        value = card.last.last.first 
      end
      value
    end.sum

    sum_high = @hand.map do |card|
      value = card.last.last
      if value.is_a?(Array)
        value = card.last.last.last
      end
      value
    end.sum

    sums = [sum_low, sum_high]
    sums.min == sums.max ? sums.first : sums
  end

  def bust?
    sum = self.sum
    sum.is_a?(Array) ? (sum.min > 21) : (sum > 21)
  end
  
  def at_minimum?
    sum = self.sum 
    if sum.is_a?(Array) 
      if sum.max <= 21
        sum.max >= 17 
      else
        sum.min >= 17 
      end
    else
      sum >= 17
    end
  end

  def hit?
    output("Would you like to hit? (y/n)")
    answer = gets.chomp.downcase.chr
    answer == 'y'
  end

 # def stand?(end_turn: false)
 #   end_turn 
 # end
  
  def max_sum(num)
    max = num
    if num.is_a?(Array)
      if num.max > 21
        num.min
      else
        num.max
      end
    else
      max
    end
  end

  def display_card(card)
    over = "\uFFE3"
    under = "\uFF3F" 
    right_line = "\u23B9"
    left_line = "\u23B8"
    space = ' '
    puts right_line + over * 5 + left_line
    puts right_line + space * 10 + left_line
    puts right_line + "#{card[1][0]}".center(10) + left_line
    puts right_line + "#{card[0].to_s.upcase}".center(10) + left_line
    puts right_line + space * 10 + left_line
    puts right_line + under * 5 + left_line
  end
end

class TwentyOneGame
  include UI

  attr_accessor :deck, :player, :dealer, :winner, :net_earnings

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Player.new
    @winner = nil
    @net_earnings = nil
  end

  def play
    greet
    game_round 
    goodbye
  end

  private

  def greet
    display_welcome_message
    player.request_name
    rules
    player.request_money
  end

  def display_welcome_message
    output("Welcome to 21!") 
    new_line
  end

  def rules
    output("Below are the rules of the game:")
    new_line
    output("21, also know as BlackJack, is a 1 person game playing against the house")
    new_line
    output("Before sitting at the table, you must deposit money into your online player account")
    output("At the start of each round, you will place a bet")
    new_line
    output("The dealer will deal you two cards and themselves two cards, all face up")
    new_line
    output("The winner of each round will be the player (or dealer) whose hand's sum is closest to 21")
    output("Once the initial two cards are dealt, you will have the option to receive as many cards as you'd like")
    new_line
    output("If the sum of your cards is ever greater than 21, you bust and the house takes your bet")
    output("'Hit' to keep receving cards. Once you're satisfied with your hand 'Stand'.")
    new_line
    output("The dealer must receive cards until they are either: a hand sum of at least 17 or greater than 21")
    output("Whoever 'busts' (goes over 21) first loses, else compare the sum of your hand to the dealer's sum at the end of the round.")
    output("If you are closer to 21 than the dealer, receive 1.5 times your bet in winnings")
    new_line
  end

  def game_round
    loop do
      player.display_money
      player.round_bet
      clear
      deal_round  
      new_line
      display_result
      calculate_money
      player.display_money
      break unless play_again?
      reset
      clear
    end
  end

  def deal_round
    initial_deal
    display_table
#    display_deck_testing
    loop do
#      binding.pry
      break if evaluate_hand
      hit_sequence
    end
    determine_winner
  end

  def initial_deal
    2.times do
      player.hand << random_deal
      dealer.hand << random_deal
    end
  end

  def random_deal
    card = deck.cards.sample
    deck.cards.delete(card)
    card
  end

  def display_deck_testing
    p deck.cards
  end


  def display_table
    new_line
    output("#{player.name}'s cards:")
    player.display_hand
    new_line
    output("Dealer's cards:")
    dealer.display_hand
    display_sum
  end

  def display_sum
    new_line
    output("Sum of #{player.name}'s cards (low/high options given if Ace in hand): #{player.sum}")
    output("Sum of dealer's cards (low/high options given if Ace in hand): #{dealer.sum}")
  end

  def evaluate_hand
    player.bust? || dealer.bust? || player.stand 
  end

  def hit_sequence
    if player.hit?
      player.hand << random_deal
      dealer.hand << random_deal unless dealer.at_minimum?
    else
      loop do
        break if dealer.at_minimum?
        dealer.hand << random_deal
      end
#      player.stand?(end_turn: true)
      player.stand = true
    end

    clear
    display_table
  end

  def determine_winner
    if player.bust? 
      @winner = @dealer
    elsif dealer.bust?
      @winner = @player
    else
      (player.max_sum(player.sum) > dealer.max_sum(dealer.sum)) ? (@winner = @player) : (@winner = @dealer)
    end
  end

  def display_result
    @winner == @player ? output("You won, #{player.name}!") : output("The house won.")
  end

  def calculate_money
    if @winner == @player
      earnings = player.bet * 1.5
      player.money += earnings
      output("You won $#{earnings.to_i}")
    else
      player.money -= player.bet 
    end
  end

  def play_again?
    output("Would you like to play again? (y/n)")
    answer = nil
    loop do
      answer = gets.chomp.downcase.chr
      break if %w(y n).include?(answer)
      output("Invalid response")
    end
    answer == 'y'
  end

  def reset
    @deck = Deck.new
    player.reset
    dealer.reset
  end

  def calculate_net_money
    @net_earnings = player.money - player.starting_money 
  end

  def goodbye
    calculate_net_money
    if @net_earnings.positive?
      output("Thanks for playing! You earned $#{@net_earnings.to_i}!")
    else
      output("Thanks for playing!")
    end
  end
end

game = TwentyOneGame.new
game.play

# only thing that could potentially still add, 
#   which i can think, 
# is a way to deposit more money if run out so that can continue playing
