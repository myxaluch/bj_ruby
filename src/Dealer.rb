##
# This class content information about Dealer (inherits from class Player)
require_relative 'Player'

class Dealer < Player

  def take_a_card deck
    card = deck.get_a_card
    card.open = false if @hand.size == 1
    @hand.push(card)
  end

  def check_blackjack
    open_hand
    if self.points_in_hand == 21 && @hand[0].value == 'A'
      puts "Dealer have BlackJack too! Wins - 1:1"
      return true
    else
      return false
    end
  end

  def open_hand
    @hand[1].open = true
    self.show_hand
  end

end
