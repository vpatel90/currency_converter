
class DifferentCurrencyCode < StandardError
  def message
    "Currency codes are not the same"
  end
end

class InvalidCurrencyLogo < StandardError

end

class Currency
  attr_accessor :amount, :curr_code
  def initialize(*args)
    raise ArgumentError if args.size > 2
    @logos = {'$': 'USD'}
    @amount, @curr_code = args
    logo = get_logo(@amount) if @amount.class == String && @amount.strip[0].to_i == 0
    @amount = @amount.to_f
    if args.size == 1
      raise InvalidCurrencyLogo if @logos[logo.to_sym].nil?
      @curr_code = @logos[logo.to_sym]
    else
      @curr_code = args[1]
    end

  end

  def get_logo(amount)
    logo = amount.slice!(0)
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
