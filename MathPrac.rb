# An Arithmetic math exercise generator in Ruby

require "mathn"

puts "Welcome to MathPrac: The arithmetic math exercise app." # Prints a welcome message in console

puts "Enter the highest possible number for your randomly generated math problem." # Gives user a choice of difficulty level
print "Enter a whole number (e.g. 100): "
begin # Starts a program loop that runs independently of the rest of the program and can be recovered if an error occurs
  level = Integer(gets) rescue false# Asks the user for input and converts it to an integer

  if level # If the user enters "1" then the difficulty is set as a variable called "level" and set to only include numbers between 1 and 10
    puts "The number you've entered is #{level}."
    puts "Either of the two randomly generated numbers will not be higher than the number you've picked."
  else
    raise "Entered invalid response" # Creates an error in the program if the else condition is true, so that the rescue/retry function gets used
  end

rescue # Tries to stop the program from exiting due to an unexpected command (e.g. wrong user input) by running the code below
  puts "Wrong input. Please enter an integer, also known as a whole number, e.g. 10, not 10.0 or a word!"
  print "Retry: "

  retry # Starts the program from the top, where the "begin" command is

end

def math(level) # Define a method (or function) called math with parameter level, that when called runs the core of the math problem generator program, set out below
  syms = [:+, :-, :/, :*] # Creates an Array of operators called 'syms', stored as symbols

  op = syms.sample # Grabs a random operator from the syms Array, using the sample method, and sets it as variable op

  num1 = rand(level) # Grabs a number at random from the given range and sets it as variable num1
  num2 = rand(level) # Grabs a number at random from the given range and sets it as variable num2

  print "Solve this problem: "

  work = "#{num1}" + "#{op}" + "#{num2}" # Takes a random value from num1, a random value from num2, and a random operator from syms and interpolates them into a string
  calc = num1.public_send(op, num2).round(2)
  puts work # Print to console the math calculation

  puts "What is your answer?"
  answer = gets.chomp.to_f # Sets an answer variable as input from the user, converted to a float

  puts "CORRECT" if calc == answer # If the answer variable matches the calc variable, tells user they are correct in console

  puts "INCORRECT, the answer is #{calc}." if calc != answer # If the answer and calc variables don't match, tells user their answer is incorrect and shows the correct answer
  #Wrap in a conditional for integer that doesnt need to be a float
end

begin # Start of program within a rescue/retry loop should user enter unexpected input

  puts "Ready to begin: Y/N?" # Puts out question in console

  choose = gets.chomp.upcase! # Gets user's input as a string and turns it into capitals, then sets it as the choose variable

  if choose == "Y" # If the user enters Y as their input, runs the loop
    loop do # Starts a loop for the math exercise generator
      math(level) # Calls the math method, defined above, so that the code block runs and uses the previously set "level" variable as a parameter, which changes what random numbers are generated for the problem
      puts "Do you want to continue? Y/N"
      continue = gets.chomp.upcase # Get user input to see if to continue with another math problem or to stop the program
      next if continue == "Y" # If the user input above is "Y", the math problem generator runs again
      break if continue == "N" # If the user input above is "N", the program exits.
    end

  elsif choose == "N" # If the user enters "N", the math program doesn't run and exits instead.
    puts "Nevermind..." # Prints message out to the console

  else # If the user enters some input at the start of the program other than "Y" or "N", anything else, then the program prints the message below to console, and restarts from the top, asking if the user is ready again, until either "Y" or "N" are entered

    puts "Say what?"
    raise "Entered number" # Creates an error in the program if the else condition is true, so that the rescue/retry function gets used
end

rescue # Tries to stop the program from exiting due to an unexpected command (e.g. wrong user input) by running the code below

  puts "Please only enter Y or N..."

  retry # Starts the program from the top, where the "begin" command is

end
