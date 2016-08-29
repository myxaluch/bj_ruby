##
# This class contained information and methods for working with Deck
# Deck was implemented like a shuffle-machine, in other words, infinity deck.
# It was made for easy, but can be update to strong rules and realistic:
#                           * number of decks - from 1 to 8
#                           * check for shuffle decks
#                           * etc.
require_relative 'Card'

class Deck

   SUITS = ["spades", "hearts", "diamonds", "clubs"]
   VALANDPOINTS = [['two', 2], ['three', 3], ['four', 4], ['five', 5], ['six', 6],
                   ['seven', 7], ['eight', 8], ['nine', 9], ['ten', 10], 
                   ["jack", 10], ["queen", 10], ["king", 10], ["ace", 11]]

  def get_a_card
    cardparams = [VALANDPOINTS[rand(VALANDPOINTS.size)]].flatten
    Card.new(cardparams[0], SUITS[rand(SUITS.size)], cardparams[1])
  end

end
