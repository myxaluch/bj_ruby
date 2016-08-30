ENV['RACK_ENV'] = 'test'

require_relative 'start'
require 'capybara'
require 'capybara/dsl'
require 'test/unit'

class BlackJackTest < Test::Unit::TestCase
  include Capybara::DSL

  def setup
    Capybara.app = Sinatra::Application.new
  end

  def test_title_content
    visit '/'
    assert page.has_content?('Welcome to CatBlackJack casino')
  end

  def test_upper_bet
    visit '/'
    click_link('+')
    assert page.has_css?('div.bet', text: 50)
  end

  def test_lower_bet
    visit '/'
    click_link('-')
    assert page.has_css?('div.bet', text: 0)
  end

  def test_change_deal_button
    visit '/'
    click_link('+')
    click_link('Deal')
    assert page.has_no_link?('Deal')
    assert page.has_link?('Hit')
    assert page.has_link?('Stay')
    assert page.has_link?('Double')
  end

  def test_dealer_card_hidden
    visit '/'
    assert page.has_css?('div.card.flipped')
  end

  def test_player_busted
    visit '/'
    if page.has_css?('div.message', text: 'You bust!') ||
       page.has_css?('div.message', text: 'Dealer bust!')
      return true
    end
  end
end
