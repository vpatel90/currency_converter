require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency_converter'

class CurrencyConverterTest < Minitest::Test
  def test_currency_converter
    assert CurrencyConverter.new
  end

  def test_conversaion_rate_exists
    converter = CurrencyConverter.new
    converter.conversion_rate = {USD:1.0, EUR:0.88}
    assert_equal({USD:1.0,EUR:0.88}, converter.conversion_rate)
  end

  


end
