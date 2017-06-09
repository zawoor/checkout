class PromotionalRule
  @type
  @threshold
  @value

  # Constructor
  # params:
  # - type: discount type (-,*)
  # - threshold: at which point discount should be applied
  # - value: discount value
  def initialize(type, threshold, value)
    @type = type
    @threshold = threshold
    @value = value
  end
end

class PromotionalRuleProduct < PromotionalRule

  # calculate price base on type
  # params:
  # - item: item object
  # - count: # of items of the same id
  # return:
  # - price: modified price
  def calculate(item, count)
    price = item.instance_variable_get(:@price)
    if count >= @threshold
      case @type
        when "-"
          price -= @value
        else
          price *= @value
      end
    end
    return price
  end
end

class PromotionalRuleTotal < PromotionalRule

  # calculate sum
  # params:
  # - sum: current sum
  # return:
  # - sum: modified sum
  def calculate(sum)
    if sum > @threshold
      case @type
        when "-"
          sum -= @value
        else
          sum *= @value
      end
    end
    return sum
  end
end