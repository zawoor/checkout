require 'test/unit'

class TestCheckout < Test::Unit::TestCase

  def test_initialize
    rules = {"001" => nil, "002" => nil}
    co = Checkout.new(rules)
    assert_equal(rules, co.promotional_rules)
  end

  def test_scan
    item = Item.new("001", "Lavender heart", 9.25)

    co = Checkout.new({"001" => nil, "002" => nil})
    co.scan(item)
    co.scan(item)
    co.scan(item)
    co.scan(item)
    assert_equal([item, item, item, item], co.items)
  end

  def test_total_1
    co = Checkout.new({
        "001" => PromotionalRuleProduct.new("-", 2, 0.75),
        "total" => PromotionalRuleTotal.new("*", 60, 0.9)
    })
    co.scan(Item.new("001", "Lavender heart", 9.25))
    co.scan(Item.new("002", "Personalised cufflinks", 45.0))
    co.scan(Item.new("003", "Kids T-shirt", 19.95))
    assert_equal(66.78, co.total)
  end

  def test_total_2
    co = Checkout.new({
        "001" => PromotionalRuleProduct.new("-", 2, 0.75),
        "total" => PromotionalRuleTotal.new("*", 60, 0.9)
    })
    co.scan(Item.new("001", "Lavender heart", 9.25))
    co.scan(Item.new("003", "Kids T-shirt", 19.95))
    co.scan(Item.new("001", "Lavender heart", 9.25))
    assert_equal(36.95, co.total)
  end

  def test_total_3
    co = Checkout.new({
                          "001" => PromotionalRuleProduct.new("-", 2, 0.75),
                          "total" => PromotionalRuleTotal.new("*", 60, 0.9)
                      })
    co.scan(Item.new("001", "Lavender heart", 9.25))
    co.scan(Item.new("002", "Personalised cufflinks", 45.0))
    co.scan(Item.new("001", "Lavender heart", 9.25))
    co.scan(Item.new("003", "Kids T-shirt", 19.95))
    assert_equal(73.76, co.total)
  end

  def test_total_4
    co = Checkout.new({})
    co.scan(Item.new("002", "Personalised cufflinks", 45.0))
    co.scan(Item.new("001", "Lavender heart", 9.25))
    co.scan(Item.new("003", "Kids T-shirt", 19.95))
    assert_equal(74.2   , co.total)
  end

end