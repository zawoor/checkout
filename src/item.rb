class Item
  @product_code
  @name
  @price

  # Constructor
  # params:
  # - product_code: Id of product
  # - name: Name of product
  # - price: Price of product
  def initialize(product_code, name, price)
    @product_code = product_code
    @name = name
    @price = price
  end
end