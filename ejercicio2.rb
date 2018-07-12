require 'date'
# El archivo cursos.txt contiene las fechas de inicio y término de cursos dictados por Desafío Latam
# durante el año 2017, con la siguiente estructura:

# Front-end, 2017-05-21, 2017-08-10
# Wordpress, 2017-04-12, 2017-11-04
# Full-stack, 2017-07-09, 2017-12-29
# Android, 2017-05-17, 2017-08-13
# Marketing, 2017-03-14, 2017-10-20
# Se pide:

# Crear una clase Course cuyo constructor reciba el nombre del curso y las fechas de inicio y término.

# Crear un método que permita leer el archivo y crear una instancia de la clase Course por línea del archivo.

# Crear métodos que permitan:

  # Saber qué cursos comienzan previo a una fecha entregada como argumento.

  # Saber qué cursos finalizan posterior a una fecha entregada como argumento.

  # En ambos el métodos argumento por defecto debe ser la fecha de hoy.
  # Ambos métodos deben levantar una excepción si la fecha recibida es >= 2018-01-01.

class Course
  def initialize(name, *dates)
    @name = name
    @dates = dates.map{ |date| Date.parse(date) }
    #print @dates
  end
  def dates_before(filter_date)
    @dates.select { |date| date < filter_date }
  end
end

file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

#print data
courses = []
data.each do |line|
  ls = line.split(', ')
  courses << Course.new(*ls)
end

print courses[1].dates_before(Date.today)
