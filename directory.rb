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
def which_letter?
  puts "Which letter would you like to filter students by?"
  letter = gets.chomp
  letter
end
def print_header(letter)
  puts "The students of Villains Academy"
  puts "-------------"
  puts "Beginning with '#{letter}'\n\n"
end
def print(names,letter)
  to_print = names.select {|name| name[:name].start_with?(letter)}
  to_print.each_with_index{|name,index| puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort)"}
end
def print_footer(names)
  puts "\nOverall, we have #{names.count} great students."
end
#User inputs students in to array
students = input_students
letter = which_letter?
#Then print them all
print_header(letter)
print(students,letter)
#Prints total number of students
print_footer(students)
