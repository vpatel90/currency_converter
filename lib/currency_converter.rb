require_relative '../lib/currency'

class CurrencyConverter
  attr_accessor :conversion_rate
  def initialize(conversion_rate)
    @conversion_rate = conversion_rate
  end
end
