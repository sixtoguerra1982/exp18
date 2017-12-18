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
      mayor[:mesa] = 0
      mayor[:dia1] = 0
      mayor[:dia2] = 0
      mayor[:dia3] = 0
      mayor[:dia4] = 0
      mayor[:indice] = 0
    if dia_uno > dia_dos and dia_uno > mayor[:max]
      mayor[:max] = dia_uno
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 1"
    end  
    if dia_uno > dia_tres and dia_uno > mayor[:max]
      mayor[:max] = dia_uno 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = 'Dia 1'
    end  
    if dia_uno > dia_cuatro and dia_uno > mayor[:max]
      mayor[:max] = dia_uno 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = 'Dia 1'
    end  
    if dia_dos > dia_uno and dia_dos > mayor[:max]
      mayor[:max] = dia_dos 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = 'Dia 2'
    end  
    if dia_dos > dia_tres and dia_dos > mayor[:max]
      mayor[:max] = dia_dos 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 2"
    end  
    if dia_dos > dia_cuatro and dia_dos > mayor[:max] 
      mayor[:max] = dia_dos 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 2"
    end  
    if dia_tres > dia_uno and dia_tres > mayor[:max] 
      mayor[:max] = dia_tres 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 3"
    end  
    if dia_tres > dia_dos and dia_tres > mayor[:max]
      mayor[:max] = dia_tres 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 3"
    end  
    if dia_tres > dia_cuatro and dia_tres > mayor[:max]
      mayor[:max] = dia_tres 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 3"
    end  
    if dia_cuatro > dia_uno and dia_cuatro > mayor[:max]
      mayor[:max] = dia_cuatro 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 4"
    end  
    if dia_cuatro > dia_dos and dia_cuatro > mayor[:max]
      mayor[:max] = dia_cuatro 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 4"
    end  
    if dia_cuatro > dia_cuatro and dia_cuatro > mayor[:max]
      mayor[:max] = dia_cuatro 
      mayor[:mesa] = mesa
      mayor[:dia1] = dia_uno
      mayor[:dia2] = dia_dos
      mayor[:dia3] = dia_tres
      mayor[:dia4] = dia_cuatro
      mayor[:indice] = "Dia 4"
    end  
    mayor
  end  
  def promedio
    suma = (dia_uno + dia_dos +  dia_tres + dia_cuatro) / 4.0
  end  
end

#instanciar cada linea del archivo

table = []
data = File.open('casino.txt', 'r'){|f| f.readlines}
data.each_with_index do |line, ind|
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

