@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '9. Exit'
end

def process(selection)
  case selection
  when '1'
    students = input_students
  when '2'
    show_students
  when '9'
    exit
  else
    puts "I don't known what you meant, try again"
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def input_students
  puts 'Please enter the name and cohort of the students in this format: name, cohort'
  puts 'To finish, just hit return twice'
  input = gets.chomp
  until input.empty?
    name, cohort = input.split(',')
    @students << { name: name, cohort: cohort }
    puts "Now we have #{@students.count} students"
    input = gets.chomp
  end
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

interactive_menu
