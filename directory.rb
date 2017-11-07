def input_students
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "Please enter the height of the student"
  height = gets.chomp
  puts "Please enter the nationality of the student"
  nationality = gets.chomp
  while true do
    students << {name: name, cohort: :november, height: height, nationality: nationality}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    if name.empty?
      break
    end
    height = gets.chomp
    nationality = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(names)
  names.each_with_index{|name,index| puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort). Height: #{name[:height]}, Nationality: #{name[:nationality]}"}
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
