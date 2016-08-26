##
# This class content information about card
class Card

  ##
  # +suit+ - Suit of card
  # +value+ - 1, 2, 3, 4,.., King, Ace
  # +open+ - Position of card on the table: open or not-open (default = true)
  # +points+ - Points for this :value of card
  # +used+ - Already used on this game or not ( default = false)

  attr_accessor :suit, :value, :open, :points, :used


  def initialize(value = 'Q', suit = '♠', points = '10')
    @value = value
    @suit = suit
    @open = true
    @points = points
    @used = false
  end

end
