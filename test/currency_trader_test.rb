require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency_trader'

class CurrencyTraderTest < Minitest::Test
  def setup
    @starting_currency = Currency.new('$1000')
    @converters = [CurrencyConverter.new({USD:1.0,EUR:0.88346,GBP:0.69075}),
                  CurrencyConverter.new({USD:1.0,EUR:0.88346,GBP:0.59075})]

  end

  def test_currency_trader
    assert CurrencyTrader.new(@starting_currency, @converters)
  end

  def test_trade_investing
    investments = [Currency.new(1000,:USD),Currency.new(883.46,:EUR),Currency.new(690.75, :GBP)]
    assert_equal(investments, CurrencyTrader.new(@starting_currency, @converters).investing)
  end

  def test_trade_returns
    investments = [Currency.new(1000,:USD),Currency.new(883.46,:EUR),Currency.new(690.75, :GBP)]
    best_trade = [1169.27634, Currency.new(1169.27634, "USD"), "Buy GBP and then sell it for USD"]
    assert_equal(best_trade, CurrencyTrader.new(@starting_currency, @converters).returns(investments))
  end

end
