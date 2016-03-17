
class DifferentCurrencyCode < StandardError
  def message
    "Currency codes are not the same"
  end
end

class Currency
  attr_accessor :amount, :curr_code
  def initialize(amount,curr_code)
    @amount = amount
    @curr_code = curr_code
  end

  def ==(other)
    self.amount == other.amount && self.curr_code == other.curr_code
  end

  def +(other)
    unless self.curr_code == other.curr_code
      raise DifferentCurrencyCode
    else
      Currency.new(self.amount + other.amount, self.curr_code)
    end
  end

  def -(other)
    unless self.curr_code == other.curr_code
      raise DifferentCurrencyCode
    else
      Currency.new(self.amount - other.amount, self.curr_code)
    end
  end

  def *(n)
    Currency.new((self.amount * n).round(2), self.curr_code)
  end

end
