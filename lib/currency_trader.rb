require_relative '../lib/currency_converter'

class CurrencyTrader
  def initialize(starting_currency, converters)
    @starting_currency = starting_currency
    @converters = converters
    @starting_currency_code = @starting_currency.curr_code
    @investment_pattern = []
  end

  def start_trade
    investments = investing
    best_return = returns(investments)
  end

  def investing
    investments = []
    buying = @converters[0]
    buying.rate.each do |key,value|
      investments << buying.convert(@starting_currency, key)
    end
    return investments
  end

  def returns(investments)
    best_return = [0]
    #require 'pry' ; binding.pry
    selling = @converters[1]
    investments.each do |currency|
      return_obj = selling.convert(currency,@starting_currency_code)
      if return_obj.amount > best_return[0]
        best_return = [return_obj.amount, return_obj, "Buy #{currency.curr_code} and then sell it for #{return_obj.curr_code}"]
      end
    end

    return best_return
  end

end
