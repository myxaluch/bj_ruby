require_relative 'BlackJack'

puts "Welcome to CatBlackJack" +
     "!House rules:\n" +
     "------------\n" +
     "  * Blackjack wins 3:2\n" +
     "  * Dealer stands at 17\n" +
     "  * Double-down only on first two cards\n" +
     "  * Double-down limited to 100% of bet\n"

puts "Enter your name: "
name = gets.chomp
puts "Enter your money: "
money = gets.chomp.to_i
player = Player.new(name, money)
game = BlackJack.new(player)
loop do
  player.show_status
  puts "Enter your bet: "
  bet = gets.chomp.to_i
  game.round bet
  if player.bankrupt?
    puts "Sorry, you haven't money"
    break
  end
  puts "Would you like to continue? (y)es/(n)o"
  answer = gets.chomp
  case answer
  when 'y'
    next
  when 'n'
    puts "Thank you, good luck!"
    break
  else
    puts "Input correct answer!"
  end
end
