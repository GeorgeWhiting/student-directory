def input_students
  students = []
  while true do
    puts "Please enter the name of a student. To finish, just hit return."
    name = gets.chomp
    if name.empty?
      break
    end
    puts "Which cohort does the student belong to?"
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty?
      cohort = "N/A".to_sym
    end
    puts "Please enter the height of the student"
    height = gets.chomp
    if height.empty?
      height = "N/A"
    end
    puts "Please enter the nationality of the student"
    nationality = gets.chomp.capitalize
    if nationality.empty?
      nationality = "N/A"
    end
    students << {name: name, cohort: cohort, height: height, nationality: nationality}
    puts "Now we have #{students.count} students"
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
