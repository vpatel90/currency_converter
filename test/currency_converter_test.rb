require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency_converter'

class CurrencyConverterTest < Minitest::Test
  def test_currency_converter
    assert CurrencyConverter.new({USD:1.0,EUR:0.88346,GBP:0.69075})
  end

  def setup
    @converter = CurrencyConverter.new( {USD:1.0,EUR:0.88346,GBP:0.69075} )
  end

  def test_conversaion_rate_exists
    assert_equal({USD:1.0,EUR:0.88346,GBP:0.69075}, @converter.rate)
  end

  def test_convert
    currency1 = Currency.new(10, 'USD')
    currency2 = Currency.new(8.83, 'EUR')
    currency3 = Currency.new(14, 'USD')
    currency4 = Currency.new(1557.71, 'Yen')

    assert_equal currency2, @converter.convert(currency1, 'EUR')
    assert_raises UnknownCurrencyError do
      @converter.convert(currency3, 'Yen')
    end
    assert_raises UnknownCurrencyError do
      @converter.convert(currency4, 'USD')
    end

    currency5 = Currency.new(22, 'EUR')
    currency6 = Currency.new(17.20, 'GBP')

    assert_equal currency6, @converter.convert(currency5, 'GBP')

  end


end
