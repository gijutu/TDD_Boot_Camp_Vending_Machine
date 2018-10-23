class Drink
  attr_reader :name, :price
  
  def initialize (name,price)
    @name = name
    @price = price
  end

  def to_h
    { name: @name,
    price: @price }
  end
end
