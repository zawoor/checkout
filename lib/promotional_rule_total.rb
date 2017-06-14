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