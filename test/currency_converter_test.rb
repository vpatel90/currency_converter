require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency_converter'

class CurrencyConverterTest < Minitest::Test
  def test_currency_converter
    assert CurrencyConverter.new
  end

  def test_conversaion_rate_exists
    converter = CurrencyConverter.new( {USD:1.0,EUR:0.88,GBP:0.69} )
    assert_equal({USD:1.0,EUR:0.88,GBP:0.69}, converter.conversion_rate)
  end

  def test_convert

  end


end
