# An Arithmetic math exercise generator in Ruby

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
    work = "#{num1}" + "#{op}" + "#{num2}"
    calc = num1.public_send(op, num2).round(2)
    puts work
    puts "What is your answer?"
    answer = gets.chomp.to_f
    puts "CORRECT" if calc == answer
    puts "INCORRECT, the answer is #{calc}." if calc != answer
    puts "Do you want to continue? Y/N"
    continue = gets.chomp.upcase
    next if continue == "Y"
    break if continue == "N"
  end
  puts "Ok, take care!"
elsif choose == "N"
  puts "Nevermind..."
else
  puts "Say what?"
end
