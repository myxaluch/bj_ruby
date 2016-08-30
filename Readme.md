# CatBlackJack - BlackJack in Ruby (with Sinatra)
-----

This is an implementation of Blackjack in Ruby with the following house rules:

  * Blackjack wins 3:2
  * Dealer stands at 17
  * Double-down only on first two cards
  * Double-down limited to 100% of bet


### Running game

* Clone this repo
* Run bundle
<pre>
    $> cd bj-ruby
    bj-ruby> bundle install
</pre>
* To run the game
<pre>
    bj-ruby> ruby start.rb
</pre>
* and open your browser on http://localhost:4567/
* Choose the bet by "+" / "-" and press "Deal"

### Running test
* To run the test
<pre>
    bj-ruby> ruby start_test.rb
</pre>


### Specification
Implement a simple game of Blackjack. It used a web-interface (via Sinatra). Player start game with $1000, and allow to make bet with 50$-step for each deal.

The program implement the core Blackjack rules, i.e. players can choose to hit until they go over 21, the dealer must hit on 16 and stay on 17 and also support doubling-down.

The UI(css) partly taken from this repo: https://github.com/tonyspiro/blackjack (thanks for tonyspiro)
