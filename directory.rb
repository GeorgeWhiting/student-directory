@students = []
@months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, "N/A".to_sym]
def input_students
  while true do
    name = get_variable("name")
    if name == "N/A".to_sym
      break
    end
    cohort = get_variable("cohort").capitalize.to_sym
    while !@months.include?(cohort)
      cohort = get_variable("cohort").capitalize.to_sym
    end
    height = get_variable("height")
    nationality = get_variable("nationality").capitalize

    fill_student_array(name, cohort, height, nationality)
    message = "Now we have #{@students.count} students"
    puts @students.count == 1? message.chop : message
  end
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  @students.sort_by!{|a| @months.index(a[:cohort])}
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
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to students.csv"
  puts "4. Load students from students.csv"
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
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Thats not a command"
  end
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:height], student[:nationality]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved to file"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, height, nationality = line.chomp.split(",")
    fill_student_array(name, cohort, height, nationality)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
    puts "Loaded #{@students.count} students from students.csv"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def fill_student_array(name, cohort, height, nationality)
  @students << {name: name, cohort: cohort.to_sym, height: height, nationality: nationality}
end

def get_variable(property)
  puts "Please enter the #{property} of the student"
  variable = STDIN.gets.chomp
  if variable.empty?
    variable = "N/A".to_sym
  end
  variable
end

try_load_students
interactive_menu
