class Checkout
  attr_reader :promotional_rules
  attr_reader :items

  # Constructor
  # Params:
  # - promotional_rules: Hash with Rules
  def initialize(promotional_rules)
    @items = []
    @promotional_rules = promotional_rules
  end

  # Add Item to Cart
  # params:
  # - items: Item Object
  def scan(item)
    item.rule = @promotional_rules.key?(item.product_code) ? @promotional_rules[item.product_code] : nil
    @items.push(item)
  end

  # Calculate Total
  # returns:
  # - Total: Sum of product prices
  def total
    total = items_total
    return ('%.2f' % (total - total_discount(total))).to_f
  end

  def total_discount(sum)
    discounted_total = sum
    if @promotional_rules.key?("total")
      discounted_total = @promotional_rules["total"].calculate(sum)
    end
    sum - discounted_total
  end

  def items_total
    @items.inject(0) do |sum, item|
      sum + item.final_price(@items.select {|i| i.product_code == item.product_code}.length)
    end
  end
end