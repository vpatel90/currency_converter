require_relative '../lib/currency'
class UnknownCurrencyError < StandardError
  def message
    "The currency is unknown to the converter"
  end
end

class CurrencyConverter
  attr_accessor :rate
  def initialize(conversion_rate)
    @rate = conversion_rate
  end

  def convert(currency, new_code)
    raise UnknownCurrencyError if @rate[currency.curr_code.to_sym].nil? || @rate[new_code.to_sym].nil?

    new_value = (@rate[new_code.to_sym] /
                @rate[currency.curr_code.to_sym]) * currency.amount
    Currency.new(new_value.round(2), new_code)
  end
end
