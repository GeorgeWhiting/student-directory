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
    students << {name: name, cohort: :November, height: height, nationality: nationality}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of a student"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Please enter the height of the student"
    height = gets.chomp
    puts "Please enter the nationality of the student"
    nationality = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(names)
  names.each_with_index{|name,index| puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort). Height: #{name[:height]}, Nationality: #{name[:nationality]}".center(100)}
end
def print_footer(names)
  puts
  puts "Overall, we have #{names.count} great students.".center(100)
end
#User inputs students in to array
students = input_students
#Then print them all
print_header
print(students)
#Prints total number of students
print_footer(students)
