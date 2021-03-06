@students = []
def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_hash_to_students_arr(name, cohort)
  @students << { name: name, cohort: cohort.to_sym }
end

def load_students(filename = 'students.csv')
  File.open(filename, 'r+') do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_hash_to_students_arr(name, cohort) unless @students.include?(name: name, cohort: cohort.to_sym)
    end
  end
  puts "loaded #{@students.count} from #{filename}"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '3. Save the list of students to students.csv'
  puts '4. Load the list from students.csv'
  puts '9. Exit'
end

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '3'
    save_students
  when '4'
    load_students
  when '9'
    exit
  else
    puts "I don't known what you meant, try again"
  end
end

def input_students
  puts 'Please enter the name and cohort of the students in this format: name, cohort'
  puts 'To finish, just hit return twice'
  input = STDIN.gets.chomp
  until input.empty?
    name, cohort = input.chomp.split(',')
    add_hash_to_students_arr(name, cohort)
    puts "Now we have #{@students.count} students"
    input = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  File.open('students.csv', 'a+') do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(',')
      file.puts csv_line unless File.readlines(file).grep(/#{csv_line}/).any?
    end
  end
  puts 'Students saved successfully'
end

def print_header
  puts 'The students of Villains Academy'.center(40)
  puts '-------------'.center(40)
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index += 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(40)
end

try_load_students
interactive_menu
