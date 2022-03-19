=begin

1. Make a list of numbers from 1-100 inclusive  
2. Loop through those numbers
3. For each number:
 a. if it's divisible by 3, puts "Fizz"
 b. if it's divisible by 5, puts "Buzz"
 c. if it's divisible by 3 && 5, puts "FizzBuzz"
 d. otherwise, puts the Number

----------------------------------------------

e.g.
  if ...
    ...
  elsif n % 3 == 0
    puts "Fizz"
  else
    ...
  end

----------------------------------------------
  # Hint on how to construct the control flow
  https://stackoverflow.com/questions/23893253/how-do-i-use-elsif-and-ranges/23893423
  
=end

# Starter code below

(1..100).each do |num|

    # num references each number in the loop (1 to 15)
    if num % 3 == 0 && num % 5 == 0 
        puts "FizzBuzz"
    elsif num % 5 == 0
        puts "Bizz"
    elsif num % 3 == 0
        puts "Fizz"    
    else
        puts num
    end
  
  end
  