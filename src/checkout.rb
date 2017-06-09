class Checkout
  @promotional_rules
  @items

  # Constructor
  # Params:
  # - promotional_rules: Hash with Rules
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
  end

  # Add Item to Cart
  # params:
  # - items: Item Object
  def scan(item)
    if @items.kind_of?(Array)
      @items.push(item)
    else
      @items = [item]
    end
  end

  # Calculate Total
  # returns:
  # - Total: Sum of product prices
  def total
    sum       = 0
    itemCount = {}

    ## calculate individual product count
    @items.each do |item|
      if itemCount.key?(item.instance_variable_get(:@product_code))
        itemCount[item.instance_variable_get(:@product_code)] += 1
      else
        itemCount[item.instance_variable_get(:@product_code)] = 1
      end
    end

    ## Iterate through Items Array
    @items.each do |item|
      if @promotional_rules.key?(item.instance_variable_get(:@product_code))
        sum += @promotional_rules[item.instance_variable_get(:@product_code)].calculate(item, itemCount[item.instance_variable_get(:@product_code)])
      else
        sum += item.instance_variable_get(:@price)
      end
    end

    ## Apply Total Discout
    if @promotional_rules.key?("total")
      sum = @promotional_rules["total"].calculate(sum)
    end

    return ('%.2f' % sum).to_f
  end
end