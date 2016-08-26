##
# This class contained information and methods for working with Deck
require_relative 'Card'

class Deck
   @cards

   SUITS = ["♠", "♥", "♦", "♣"]
   VALANDPOINTS = [[2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8], [9, 9],
            [10, 10], ["J", 10], ["Q", 10], ["K", 10], ["A", 11]]

  def initialize
  end

  def get_a_card
    randparams = [VALANDPOINTS[rand(VALANDPOINTS.size)]]
    card = Card.new(randparams[0], SUITS[rand(SUITS.size)], randparams[1])
  end


end
