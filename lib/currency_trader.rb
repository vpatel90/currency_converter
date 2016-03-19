require_relative '../lib/currency_converter'

class TradeNode
  attr_accessor :currency, :value, :code, :parent_node, :depth
  def initialize(currency, depth, parent_node = nil)
    @currency = currency
    @value = currency.amount
    @code = currency.curr_code
    @parent_node = parent_node
    @depth = depth
  end
end

class CurrencyTrader
  def initialize(starting_currency, converters)
    @starting_currency = starting_currency
    @converters = converters
    @starting_currency_code = @starting_currency.curr_code
    @investment_pattern = []
  end

  def anustart
    terminal_nodes = multi_trades(@converters)
    useful_nodes = []
    terminal_nodes.each do |node|
      if node.depth == 1 && node.code == @starting_currency_code
        useful_nodes << node
      end
    end
    best_node = nil
    useful_nodes.each do |node|
      if best_node.nil?
        best_node = node
      elsif node.value > best_node.value
        best_node = node
      end
    end
    return best_node.currency
  end

  def multi_trades(converters)
    depth = converters.length
    child_nodes = []
    return_arr = []
    parent_node = [TradeNode.new(@starting_currency, depth + 1)]
    investments = [@starting_currency]
    converters.each do |converter|
      until investments.size == 0 do
        investment = investments.shift
        converter.rate.each do |key,value|
          child_currency = converter.convert(investment, key)
          return_arr << child_currency
          child_nodes << TradeNode.new(child_currency, depth, parent_node)
        end
      end
      investments = return_arr.dup
      parent_node = child_nodes.dup
      child_nodes = []
      return_arr = []
      depth = depth - 1
    end
    return parent_node
  end

end
