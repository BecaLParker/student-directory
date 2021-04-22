@students = [] # an empty array, accessible to all methods

def interactive_menu
  loop do
    # 1. display the menu options
    print_menu
    # 2. read the input menu and save it to the variable
    selection = gets.chomp
    # 3. do what the user has asked
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
end

def print_menu
  puts '1. Input the students'
  puts '2. Show the students'
  puts '9. Exit'
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def input_students
  puts 'Please enter the name and cohort of the students in this format: name, cohort'
  puts 'To finish, just hit return twice'

  # get the first name

  input = gets.chomp

  # while the input is not empty, repeat this code
  until input.empty?
    # add the student hash to the array
    name, cohort = input.split(',')
    @students << { name: name, cohort: cohort }
    puts "Now we have #{@students.count} students"
    # get another name from the user
    input = gets.chomp
  end
  # return the array of students
  # students
end

def print_header
  puts 'The students of Villains Academy'.center(40)
  puts '-------------'.center(40)
end

def print(_students)
  @students.each_with_index do |student, index|
    puts "#{index += 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    # end
  end
end

def print_footer(_students)
  puts "Overall, we have #{@students.count} great students".center(40)
end
# nothing happens until we call the methods
interactive_menu
# students = input_students
# print_header
# print(students)
# print_footer(students)
