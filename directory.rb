# Let's put all the students into an array
# # students = [
#   { name: 'Dr. Hannibal Lector', cohort: :november },
#   { name: 'Darth Vader', cohort: :november },
#   { name: 'Nurse Ratched', cohort: :november },
#   { name: 'Michael Corleone', cohort: :november },
#   { name: 'Alex DeLarge', cohort: :november },
#   { name: 'The Wicked Witch of the West', cohort: :november },
#   { name: 'Terminator', cohort: :november },
#   { name: 'Freddy Krueger', cohort: :november },
#   { name: 'The Joker', cohort: :november },
#   { name: 'Joffrey Baratheon', cohort: :november },
#   { name: 'Norman Bates', cohort: :november }
# ]
def input_students
  puts 'Please enter the name and cohort of the students in this format: name, cohort'
  puts 'To finish, just hit return twice'
  # create an empty array
  students = []
  # get the first name
  name, cohort = gets.chomp.split(',')
  # while the araay is not empty, repeat this code
  until name.empty? || cohort.empty?
    # add the student hash to the array
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name, cohort = gets.chomp.split(',')
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
students = input_students
print_header
print(students)
print_footer(students)
