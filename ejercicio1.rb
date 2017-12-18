class Table
  attr_accessor :mesa, :dia_uno, :dia_dos, :dia_tres, :dia_cuatro
  def initialize(mesa, dia_uno, dia_dos, dia_tres, dia_cuatro)
    @mesa = mesa
    @dia_uno = dia_uno.to_i
    @dia_dos = dia_dos.to_i
    @dia_tres = dia_tres.to_i
    @dia_cuatro = dia_cuatro.to_i
  end
  #Conocer el mayor valor recaudado, y a que mesa y día corresponde
  def mayor_valor_recuaudado
    mayor = {}
    mayor[:max]= 0
    x = []
    x << dia_uno
    x << dia_dos
    x << dia_tres
    x << dia_cuatro
    mayor[:max] = x.max
    mayor[:mesa] = mesa
    mayor[:dia1] = dia_uno
    mayor[:dia2] = dia_dos
    mayor[:dia3] = dia_tres
    mayor[:dia4] = dia_cuatro
    indice = 0
    x.each_with_index {|ele, ind| indice = ind if ele == x.max}
    mayor[:indice] = indice
    mayor
  end  
  def promedio
    suma = (dia_uno + dia_dos +  dia_tres + dia_cuatro) / 4.0
  end  
end

#instanciar cada linea del archivo

table = []
data = File.open('casino.txt', 'r'){|f| f.readlines}
data.each do |line|
  mesa, dia_uno, dia_dos, dia_tres, dia_cuatro = line.split(', ')
  table << Table.new(mesa, dia_uno, dia_dos, dia_tres, dia_cuatro)
end

h = []
h_promedio = []
table.each do |line|
  h << line.mayor_valor_recuaudado
  h_promedio << line.promedio
  print "#{line.mesa}  #{line.dia_uno} #{line.dia_dos} #{line.dia_tres} #{line.dia_cuatro} Promedio: #{h_promedio.last}\n"
end
arreglo_max = []
h.each {|table| arreglo_max << table[:max]}
indice = 0
arreglo_max.each_with_index {|ele, ind| indice = ind if ele == arreglo_max.max}
puts "\n Mayor Valor Recaudado : #{h[indice][:max]} \n Mesa: #{h[indice][:mesa]} \n Dia : #{h[indice][:indice]} "