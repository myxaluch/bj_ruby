##
# This class containts main logic information for BlackJack
# Main method : +round+. Some info
require_relative 'Dealer'

class BlackJack

  def initialize(player)
    @dealer = Dealer.new
    @player = player
    @deck = Deck.new
  end

  def round bet
    @bet = bet
    if first_round
      if make_decision
        if dealer_turn
          if end_of_game
            reset_round
          end
        else
          puts "Dealer bust: #{@dealer.points_in_hand}, you win!"
          @player.money += @bet
          reset_round
        end
      else
        puts "Bust: #{@player.points_in_hand}"
        @player.money -= @bet
        reset_round
      end
    else
      reset_round
    end
  end

  private

  def make_decision
    loop do
      puts "You turn: (h)it, (s)top"
      turn = gets.chomp
      case turn
        when 'h'
          @player.take_a_card(@deck)
          @player.show_hand
          if @player.bust?
            return false
          end
        when 's'
          puts "Wait for result, your score : #{@player.points_in_hand}"
          return true
        else
          puts "Please, enter the correct turn!"
      end
    end
  end

  def dealer_turn
    @dealer.open_hand
    loop do
        break if @dealer.points_in_hand >= 17
        @dealer.take_a_card(@deck)
        @dealer.show_hand
        sleep 2
        if @dealer.bust?
          return false
        end
    end
    return true
  end

  def end_of_game
    if @player.points_in_hand > @dealer.points_in_hand
      puts "You win!"
      @player.money += @bet
    elsif @player.points_in_hand < @dealer.points_in_hand
      puts "You lose!"
      @player.money -= @bet
    else
      puts "Stay"
    end
    return true
  end

  def reset_round
    @player.clear_hand
    @dealer.clear_hand
  end

  def first_round
    @player.take_a_card(@deck)
    @player.take_a_card(@deck)
    @player.show_hand
    sleep 2
    @dealer.take_a_card(@deck)
    @dealer.take_a_card(@deck)
    @dealer.show_hand
    sleep 2
    puts "You can double-down. (y)es/(n)o"
    answer = gets.chomp
    case answer
      when 'y'
        @bet *= 2
        puts "Your bet now: #{@bet}"
        @player.take_a_card(@deck)
        @player.show_hand
        if @player.bust?
          puts "Bust: #{@player.points_in_hand}"
          @player.money -= @bet
          return false
        end
      when 'n'
         return true
      else
        puts "Please, enter the correct answer!"
    end
    if @player.check_blackjack
      puts 'Lucky - BlackJack!'
      if @dealer.check_blackjack
        @player.money += @bet
        return false
      else
        puts "You win 3:2! Congratulations"
        @player.money += 1.5 * @bet
        return false
      end
    end
    return true
  end
end
