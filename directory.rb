def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(names)
  names.each{|name| puts "#{name[:name]} (#{name[:cohort]} cohort)"}
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end
#User inputs students in to array
students = input_students
#Then print them all
print_header
print(students)
#Prints total number of students
print_footer(students)
