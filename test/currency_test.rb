require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/currency'

class CurrencyTest < Minitest::Test
  def test_Currency
    assert Currency.new(10,'$')
  end

  def test_amount_curr_code
    currency = Currency.new(10,'$')
    assert_equal(10,currency.amount)
    assert_equal('$',currency.curr_code)
  end

  def test_currency_equals_currency
    currency1 = Currency.new(10, 'USD')
    currency2 = Currency.new(10, 'USD')
    currency3 = Currency.new(10, 'EUR')
    currency4 = Currency.new(20, 'USD')
    currency5 = Currency.new(50, 'Peso')

    assert_equal(currency1, currency2)
    refute_equal(currency1, currency3)
    refute_equal(currency1, currency4)
    refute_equal(currency1, currency5)
  end

  def test_add_currency_to_same_code
    currency1 = Currency.new(10, 'USD')
    currency2 = Currency.new(10, 'USD')
    currency3 = Currency.new(20, 'USD')
    currency4 = Currency.new(10, 'EUR')
    currency5 = Currency.new(45, 'USD')
    currency6 = Currency.new(55, 'USD')

    assert_equal currency3, currency1 + currency2
    assert_raises DifferentCurrencyCode do
      currency1 + currency4
    end
    assert_equal currency6, currency1 + currency5
  end

  def test_subtract_currency_to_same_code
    currency1 = Currency.new(30, 'USD')
    currency2 = Currency.new(10, 'USD')
    currency3 = Currency.new(20, 'USD')
    currency4 = Currency.new(10, 'EUR')
    currency5 = Currency.new(15, 'USD')
    currency6 = Currency.new(15, 'USD')

    assert_equal currency3, currency1 - currency2
    assert_raises DifferentCurrencyCode do
      currency1 - currency4
    end
    assert_equal currency6, currency1 - currency5
  end

  def test_multiply_currency_to_same_code
    currency1 = Currency.new(10, 'USD')
    currency2 = Currency.new(50, 'USD')
    currency3 = Currency.new(20, 'USD')
    currency4 = Currency.new(200, 'USD')
    currency5 = Currency.new(15, 'USD')
    currency6 = Currency.new(7.5, 'USD')

    assert_equal currency2, currency1 * 5
    assert_equal currency4, currency3 * 10
    assert_equal currency6, currency5 * 0.5
  end

end
