# El archivo casino.txt contiene las recaudaciones de 4 días de un casino separadas por mesa de juego.

# Mesa 1, 90, 60, 10, 30
# Mesa 2, 40, 34, 77, 11
# Mesa 3, 34, 86, 55, 91
# Mesa 4, 67, 93, 43, 87
#Se pide:

# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones correspondientes
# de cada día.

# Hint: El constructor debe recibir 5 argumentos. Uno para el nombre de la mesa y los demás para cada
# recaudación correspondiente a esa mesa.
# Crear un método que permita leer el archivo e instanciar un objeto de la clase Table por cada línea del
# archivo.

# Crear métodos que permitan:

# Conocer el mayor valor recaudado, por mesa, y el nombre de la mesa y día corresponde (día 1, día 2,
# día 3 o día 4).

# Calcular el promedio total de lo recaudado por todas las mesas en todos los días.
class Table
  attr_reader :mesa, :recaudaciones
  def initialize(mesa, *recaudaciones)
    # print mesa
    # print recaudaciones
    @mesa = mesa
    @recaudaciones = recaudaciones.map(&:to_i)

  end
  def self.build(file)#tambien puede ser: def Table.build(file)
    tables = []
    File.readlines(file).each do |line|
      table_info = line.chomp.split(', ')
      #mesa, recaudaciones = table_info.shift, table_info
      mesa = table_info.shift
      recaudaciones = table_info
      tables << Table.new(mesa, *recaudaciones) #tambien puede sin Table.. <<(es lo mismo que push)
    end
    return tables
  end

  def Table.max_profit(file)
    tables = build(file)
    best_results = {}
    tables.each_with_index do |table, day|
      best_results[table.mesa] = [table.max, table.max_day]
    end
    best_results
  end

  def Table.avg_profit(file)
    tables = build(file)


  end

  def max
      recaudaciones.max
  end
  def max_day
    recaudaciones.index(max) + 1
  end
end

print Table.max_profit('casino.txt')
# file = File.open('casino.txt', 'r')
# data = file.readlines
# file.close
#
# data.each do |line|
#   ls = line.split(', ')
#   Table.new(*ls)
# end
