##
# This class content information about card
class Card

  ##
  # +suit+ - Suit of card : "♠", "♥", "♦", "♣"
  # +value+ - Value of card : 1, 2, 3, 4,..J, Q, K, A
  # +open+ - Position of card on the table: open or not-open (default = true)
  # +points+ - Points for :value of card
  # +used+ - Already used on this game or not (default = false)

  attr_accessor :suit, :value, :open, :points, :used

  def initialize(value = 'queen', suit = 'spades', points = 10)
    @value = value
    @suit = suit
    @open = true
    @points = points
    @used = false
  end

  def show
    if @open
      return [@value, @suit]
    else
      return [@value, @suit, 'flipped']
    end
  end

end
