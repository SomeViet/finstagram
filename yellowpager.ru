=begin
- Write a method that accepts a 10 character string of letters (both uppercase and lowercase)
- if not 10 characters in length, return false
- else:
  - define empty string variable (phone_number)
  - loop through string
  - compare letter to telephone mappings and concat to variable (phone_number)
  - return the variable (phone_number)

* You may need to ensure the letter casing of the input string *
=end


def yellow_pager(word)
    # complete the if expression and statement to meet the condition
    phone_num = ""
    
    if word.length != 10
        false
      

    else

        word.downcase.each_char do |letter|
        # complete the conditions to map letters to numbers
                if letter == "a" || letter == "b" || letter =="c"
                    phone_num += "2"
                elsif letter == "d" || letter =="e" || letter =="f"
                    phone_num += "3"
                elsif letter == "g" || letter == "h" || letter == "i"
                    phone_num += "4"
                elsif letter == "j" || letter == "k" || letter == "l"
                    phone_num += "5"
                elsif letter == "m" || letter == "n" || letter == "o"
                    phone_num += "6"
                elsif letter == "p" || letter == "q" || letter == "r" || letter == "s"
                    phone_num += "7"
                elsif letter == "t" || letter == "u" || letter == "v"
                    phone_num += "8"
                elsif letter == "w" || letter == "x" || letter == "y" || letter == "z"
                    phone_num += "9"
                else
                    phone_num += letter
                end
                print letter
        end 
      phone_num
    end
end

  # call method here (you may need to print the return value)
  p yellow_pager("Lighthouse")

