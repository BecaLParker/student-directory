def interactive_menu
  students = []
  loop do
    puts '1. Input the students'
    puts '2. Show the students'
    puts '9. Exit'
    # 2. read the input menu and save it to the variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when '1'
      students = input_students
    when '2'
      print_header
      print(students)
      print_footer(students)
    when '9'
      exit
    else
      puts "I don't known what you meant, try again"
    end
  end
end

def input_students
  puts 'Please enter the name and cohort of the students in this format: name, cohort'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first name

  input = gets.chomp

  # while the araay is not empty, repeat this code
  until input.empty?
    # add the student hash to the array
    name, cohort = input.split(',')
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    # get another name from the user
    input = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts 'The students of Villains Academy'.center(40)
  puts '-------------'.center(40)
end

def print(students)
  students.each_with_index do |student, index|
    # if student[:name].length < 12
    puts "#{index += 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    # end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end
# nothing happens until we call the methods
interactive_menu
# students = input_students
# print_header
# print(students)
# print_footer(students)
