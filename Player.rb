require_relative 'Card'

class Player
  @hand
  @money

  def initialize
  end

  def take_a_card Card
    @hand.push(card)
  end

  def points_in_hand
    handpoints
    @hand.map { |card|
      handpoints += card.points
    }
    return handpoints
  end


  end
