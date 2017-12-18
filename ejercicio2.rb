require 'date'
class Course
  attr_accessor :branch, :dates
  def initialize branch, *dates
    @branch = branch
    @dates = dates.map{|date| Date.parse(date)}
  end  
  def previous(previous_date)
    resul = ''
    if @dates[0] < previous_date
      resul = @branch 
    end
    resul
  end
  def before(previous_date)
    resul = ''
    if @dates[1] < previous_date
      resul = @branch 
    end
    resul
  end
end

arr = []
notes = File.open('notas.txt','r'){|f| f.readlines}
notes.each do |line|
  arr << line.chomp.split(', ')
end
object_course = []
arr.each do |elemen|
  object_course << Course.new(*elemen)
end

h = []
object_course.each do |elemento|
  if elemento.previous(Date.today).to_s != ''
    h << elemento.branch 
  end
end
print "\n"
print "Cursos comenzados antes de  #{Date.today} : \n  #{h}"

h = []
object_course.each do |elemento|
  if elemento.before(Date.today).to_s != ''
    h << elemento.branch 
  end
end
print "\n"
print "Cursos terminados antes de  #{Date.today} : \n  #{h}"