class Product
  attr_accessor :red
  def initialize(name, red, blue, green)
    @name = name
    @red = red.to_i
    @blue = blue.to_i
    @green = green.to_i
  end
  def total
  	@red + @blue + @green
  end
end

products = []
file = File.open('productos.txt', 'r')
data = file.readlines
file.close
data.each do |line|
	name, red, blue, green = line.split(', ')
	products << Product.new(name,red,blue,green)
end
products.each{|x| puts x.red}