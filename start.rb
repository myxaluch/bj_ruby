require 'sinatra'
require_relative 'src/BlackJack'


configure do
  set :player, Player.new
  set :card, Card.new
  set :deck, Deck.new
end


get '/' do
  erb :index
end

get '/hit' do
  settings.player.take_a_card(settings.deck)
  redirect to('/')
end

#puts "Welcome to CatBlackJack casino\n" +
#     "House rules:\n" +
#     "------------\n" +
#     "  * Start money - 1000$\n" +
#     "  * Blackjack wins 3:2\n" +
#     "  * Dealer stands at 17\n" +
#     "  * Double-down only on first two cards\n" +
#     "  * Double-down limited to 100% of bet\n"
#player = Player.new
#game = BlackJack.new
#loop do
#  player.show_bank
#  puts "Enter your bet: "
#  bet = gets.chomp.to_i
#  game.round bet
#  if player.bankrupt?
#    puts "Sorry, you haven't money"
#    break
#  end
#  puts "Would you like to continue? (y)es/(n)o"
#  answer = gets.chomp
#  case answer
#  when 'y'
#    next
#  when 'n'
#    puts "Thank you, good luck!"
#    break
#  else
#    puts "Input correct answer!"
#  end
#end
