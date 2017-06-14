require 'test/unit'

class TestPromotionalRuleTotal < Test::Unit::TestCase


  def test_calculate_minus_above
    rule = PromotionalRuleTotal.new("-", 3, 1)
    assert_equal(2, rule.calculate(2))
  end

  def test_calculate_minus_below
    rule = PromotionalRuleTotal.new("-", 10, 5)
    assert_equal(50, rule.calculate(55))
  end

  def test_calculate_multiply_above
    rule = PromotionalRuleTotal.new("*", 10, 0.5)
    assert_equal(2, rule.calculate(2))
  end

  def test_calculate_multiply_below
    rule = PromotionalRuleTotal.new("*", 10, 0.8)
    assert_equal(40, rule.calculate(50))
  end


end