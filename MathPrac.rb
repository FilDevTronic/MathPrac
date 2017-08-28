num = (1..10).to_a # Creates an Array called num of numbers 1 through and including 10

num1 = num.sample # Grabs a number at random from the num Array and sets it as variable num1
num2 = num.sample # Grabs a number at random from the num Array and sets it as variable num2

syms = [:+, :-, :/, :*] # Creates a Hash of operators called syms, stored as symbols

op = syms.sample # Grabs a random operator from the syms Hash, using the sample method, and sets it as variable op

puts "Ready to begin: Y/N?"

choose = gets.chomp.upcase!

if choose == "Y"
    print "Solve this problem: "
    work = "#{num1}" + "#{op}" + "#{num2}"
    calc = eval(work)
    puts work
    puts "What is your answer?"
    answer = gets.chomp.to_f
    if calc == answer
      puts "CORRECT"
    else
      puts "INCORRECT"
    end

elsif choose == "N"
  puts "Nevermind..."
else
  puts "Say what?"
end
