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
  puts "Displaying names shorter than 12 characters\n\n"
end
def print(names)
  to_print = names.select {|name| name[:name].length < 12}
  to_print.each_with_index{|name,index| puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort)"}
end
def print_footer(names)
  puts "\nOverall, we have #{names.count} great students."
end
#User inputs students in to array
students = input_students
#Then print them all
print_header
print(students)
#Prints total number of students
print_footer(students)
