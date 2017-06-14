require 'test/unit'

class TestPromotionalRuleProduct < Test::Unit::TestCase

  def test_calculate_minus_above
    rule = PromotionalRuleProduct.new("-", 3, 0.75)
    assert_equal(1.75   , rule.calculate(1.75, 2))
  end

  def test_calculate_minus_below
    rule = PromotionalRuleProduct.new("-", 1, 0.75)
    assert_equal(1   , rule.calculate(1.75, 2))
  end

  def test_calculate_multiply_above
    rule = PromotionalRuleProduct.new("*", 1, 0.5)
    assert_equal(1   , rule.calculate(2, 2))
  end

  def test_calculate_multiply_below
    rule = PromotionalRuleProduct.new("*", 3, 0.5)
    assert_equal(2   , rule.calculate(2, 2))
  end

end