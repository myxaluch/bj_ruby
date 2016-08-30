##
# This file containts main logic information for BlackJack.
# * Each round separate on logic part:
#   +/deal+ - get first two card and check about BlackJack
#   +/double+ - double-down and check for busted
#   +/hit+- usual turn of player with "hit" options and
#                 check for busted
#   +/stay+  - "stay" options for player and turn of dealer.
#                Stay on 17 points, check for bust
#   +/less+ and +/more+ - up and down for bet
#   +/+ - main method for rendering result
#
require 'sinatra'
require_relative 'src/Dealer'

configure do
  set :player, Player.new
  set :dealer, Dealer.new
  set :deck, Deck.new
  set :bet, 0
  set :message, ""
end


get '/' do
  erb :index
end

get '/hit' do
  settings.player.take_a_card(settings.deck)
  if settings.player.bust?
    settings.message = "You bust!"
    settings.player.money -=  settings.bet
    settings.bet = 0
  end
  redirect to('/')
end


get '/stay' do
  settings.dealer.open_hand
  loop do
    if settings.dealer.points_in_hand >= 17
      if settings.player.points_in_hand > settings.dealer.points_in_hand
        settings.message = "You win!"
        settings.player.money += settings.bet
        settings.bet = 0
      elsif settings.player.points_in_hand < settings.dealer.points_in_hand
        settings.message = "You bust!"
        settings.player.money -= settings.bet
        settings.bet = 0
      else
        settings.message "Stand"
      end
      break
    end
    settings.dealer.take_a_card(settings.deck)
    if settings.dealer.bust?
      settings.message = "Dealer bust!"
      settings.player.money +=  settings.bet
      settings.bet = 0
      break
    end
  end
  redirect to('/')
end

get '/double' do
  settings.bet *= 2
  settings.player.take_a_card(settings.deck)
  if settings.player.bust?
    settings.message = "You bust!"
    settings.player.money -=  settings.bet
    settings.bet = 0
  end
  redirect to('/')
end

get '/less' do
  if settings.bet > 0
    settings.bet -= 50
  end
  redirect to('/')
end

get '/more' do
  if settings.bet < settings.player.money
    settings.bet += 50
  end
  redirect to('/')
end

get '/deal' do
  if settings.player.bankrupt?
    settings.message = "No money - no honey"
    redirect to('/')
  end
  settings.message = ""
  settings.dealer.clear_hand
  settings.player.clear_hand
  settings.player.take_a_card(settings.deck)
  settings.player.take_a_card(settings.deck)
  settings.dealer.take_a_card(settings.deck)
  settings.dealer.take_a_card(settings.deck)
  if settings.player.check_blackjack
    settings.message = 'Lucky - BlackJack!'
    if settings.dealer.check_blackjack
      settings.message = "Dealer BlackJack too, win 1:1"
      settings.player.money += settings.bet
      settings.bet = 0
    else
      settings.message = "You win 3:2! Congratulations"
      settings.player.money += 1.5 * settings.bet
      settings.bet = 0
    end
  end
  redirect to('/')
end
