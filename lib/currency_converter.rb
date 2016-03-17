require_relative '../lib/currency'

class CurrencyConverter
  attr_accessor :conversion_rate
  def initialize
    @conversion_rate = {USD:1.0,EUR:0.88,GBP:0.69}
  end
end
