@students = []
def input_students
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
    @students << {name: name, cohort: cohort, height: height, nationality: nationality}
    message = "Now we have #{@students.count} students"
    puts @students.count == 1? message.chop : message
  end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  @students.sort_by!{|a| $months.index(a[:cohort])}
  @students.group_by{|d| d[:cohort]}.each do |g|
    g[1].each_with_index{|name,index| puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort). Height: #{name[:height]}, Nationality: #{name[:nationality]}".center(100)}
  end
end

def print_footer
  message = "Overall, we have #{@students.count} great students"
  puts
  puts @students.count == 1? message.chop.center(100) : message.center(100)
  puts
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header unless @students.count == 0
  print_students_list unless @students.count == 0
  print_footer unless @students.count == 0
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "Thats not a command"
  end
end

interactive_menu
