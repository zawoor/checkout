class Item
  attr_reader   :product_code
  attr_reader   :name
  attr_reader   :price
  attr_accessor :rule

  # Constructor
  # params:
  # - product_code: Id of product
  # - name: Name of product
  # - price: Price of product
  def initialize(product_code, name, price)
    @product_code = product_code
    @name         = name
    @price        = price
    @rule         = nil
  end

  def final_price(count)
    if @rule
      @rule.calculate(@price, count)
    else
      @price
    end
  end
end