# An Arithmetic math exercise generator in Ruby

begin # Start of program within a rescue/retry loop should user enter unexpected input

  puts "Ready to begin: Y/N?" # Puts out question in console

  choose = gets.chomp.upcase! # Gets user's input as a string and turns it into capitals, then sets it as the choose variable

  if choose == "Y" # If the user enters Y as their input, runs the loop
    loop do # Starts a loop for the math exercise generator
      num = (1..10).to_a # Creates an Array called num of numbers 1 through and including 10

      num1 = num.sample.to_f # Grabs a number at random from the num Array and sets it as variable num1
      num2 = num.sample.to_f # Grabs a number at random from the num Array and sets it as variable num2

      syms = [:+, :-, :/, :*] # Creates a Hash of operators called syms, stored as symbols

      op = syms.sample # Grabs a random operator from the syms Hash, using the sample method, and sets it as variable op

      print "Solve this problem: "

      work = "#{num1}" + "#{op}" + "#{num2}" # Takes a random value from num1, a random value from num2, and a random operator from syms and interpolates them into a string
      calc = num1.public_send(op, num2).round(2)
      puts work # Print to console the math calculation

      puts "What is your answer?"
      answer = gets.chomp.to_f # Sets an answer variable as input from the user, converted to a float

      puts "CORRECT" if calc == answer # If the answer variable matches the calc variable, tells user they are correct in console

      puts "INCORRECT, the answer is #{calc}." if calc != answer # If the answer and calc variables don't match, tells user their answer is incorrect and shows the correct answer

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
