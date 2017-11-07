def input_students
  students = []
  $months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, "N/A".to_sym]
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
    while !$months.include?(cohort)
      puts "Which cohort does the student belong to?"
      cohort = gets.chomp.capitalize.to_sym
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
    message = "Now we have #{students.count} students"
    puts students.count == 1? message.chop : message
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end
def print(names)
  names.sort_by!{|a| $months.index(a[:cohort])}
  names.group_by{|d| d[:cohort]}.each do |g|
    g[1].each_with_index{|name,index| puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort). Height: #{name[:height]}, Nationality: #{name[:nationality]}".center(100)}
  end
end
def print_footer(names)
  message = "Overall, we have #{names.count} great students"
  puts
  puts names.count == 1? message.chop.center(100) : message.center(100)
end
#User inputs students in to array
students = input_students
#Then print them all
print_header
print(students)
#Prints total number of students
print_footer(students)
