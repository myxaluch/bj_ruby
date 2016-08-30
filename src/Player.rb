##
# This class content information and methots for work with Player
require_relative 'Deck'

class Player
  attr_accessor :money

  def initialize()
    @money = 1000
    @hand = []
  end

  def take_a_card deck
    @hand.push(deck.get_a_card)
  end

  def points_in_hand
    handpoints = 0
    @hand.map { |card| handpoints += card.points }
    return handpoints
  end

  def bust?
    self.points_in_hand > 21
  end

  def check_blackjack
    if @hand.size == 2 && points_in_hand == 21
        return true
      else
        return false
    end
  end

  def bankrupt?
    @money <= 0
  end

  def clear_hand
    @hand.clear
  end

  def show_hand
    @hand.map {|card| card.show}
  end

end
