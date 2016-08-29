##
# This class contained information and methods for working with Deck
# Deck was implemented like a shuffle-machine, in other words, infinity deck.
# It was made for easy, but can be update to strong rules and realistic:
#                           * number of decks - from 1 to 8
#                           * check for shuffle decks
#                           * etc.
require_relative 'Card'

class Deck

   SUITS = ["♠", "♥", "♦", "♣"]
   VALANDPOINTS = [[2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8], [9, 9],
            [10, 10], ["J", 10], ["Q", 10], ["K", 10], ["A", 11]]

  def get_a_card
    cardparams = [VALANDPOINTS[rand(VALANDPOINTS.size)]].flatten
    Card.new(cardparams[0], SUITS[rand(SUITS.size)], cardparams[1])
  end

end
