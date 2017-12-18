class Table
    attr_accessor :nombre, :recaudaciones
    def initialize nombre, *recaudaciones
        @nombre = nombre
        @recaudaciones = recaudaciones
    end

    def prom_days
        prom = (@recaudaciones.inject(0){|sum, day| sum+=day.to_i})/@recaudaciones.length.to_f
    end

    def self.all
        gets
        arr = []
        tables = File.open('casino.txt', 'r'){|f| f.readlines}
        tables.each do |table|
            arr_table = table.chomp.split(', ')
            arr << Table.new(*arr_table)
        end
        arr
    end

    def self.highest_value tables
        arr = []
        tables.each do |table|
            h = {}
            h[:name] = table.nombre
            h[:max] = table.recaudaciones.max
            h[:day] = table.recaudaciones.index(h[:max]).to_i+1
            arr << h
        end
        max_value = 0
        new_hash = {}
        arr.each do |element|
            if element[:max].to_i > max_value
                max_value = element[:max].to_i
                new_hash = element
            end
        end
        new_hash
    end

    def self.know_prom tables
        arr = []
        tables.each do |table|
            arr << "#{table.nombre}, #{table.prom_days}"
        end
        arr
    end

end

tables = Table.all
puts tables
puts Table.highest_value(tables)
puts Table.know_prom(tables)