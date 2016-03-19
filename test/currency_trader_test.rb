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

  def test_trade_returns_anustart
    assert_equal(Currency.new(1169.27634, "USD"), CurrencyTrader.new(@starting_currency, @converters).anustart)
  end

end
