class PromotionalRuleProduct < PromotionalRule

  # calculate price base on type
  # params:
  # - price: item price before discount
  # - count: # of items of the same id
  # return:
  # - price: modified price
  def calculate(price, count)
    if count >= @threshold
      case @type
        when "-"
          price -= @value
        else
          price *= @value
      end
    end
    price
  end
end