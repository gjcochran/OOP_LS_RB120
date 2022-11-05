# Question 1 

text = "The Flintstones Rock!"

number = 0
indent = ' '
while number < 10
  puts indent + text
  indent += ' '
  number += 1
end 

# mine worked! another options using times loop rather than while loop, below 

# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2 

# puts "the value of 40 + 2 is " + (40 + 2)
# will return error because cant combine a string and an integer
# solution 
puts "the value of 40 + 2 is " + (40 + 2).to_s
# solution option #2
puts puts "the value of 40 + 2 is #{40+2}"

# Question 3 

def factors(number)
  divisor = number
  factors = []
  loop do
    if divisor > 0
      factors << number / divisor if number % divisor == 0
      divisor -= 1
    break if divisor == 0
    else 
      puts "cannot find factor of number < 1"
      break
    end
  end
  factors
end

puts factors(10)
puts factors(0)

# mine worked! but yet again made it more complex than needed to be. the key was having a condition of divisor > 0, which i did. simpler while loop example below...

# while divisor > 0
#   factors << number / divisor if number % divisor == 0
#   divisor -= 1
# end

# Question 4 

# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element
#   buffer.shift if buffer.size > max_buffer_size
#   buffer
# end

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element]
#   buffer.shift if buffer.size > max_buffer_size
#   buffer
# end

# yes, there is a difference between << and + 
# << will mutate the object that buffer is pointing to  

# Question 5 


def fib(first_num, second_num)
  limit = 15
  # sum = ''
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# Question 6 

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
#=> answer - 8 = 34

# Question 7 
# i didn't think anything he did would mutate the hash, but wasy wrong b/c ... 
# remember that in Ruby, what gets passed to a method isn't the value of the object. Under the hood, Ruby passes the object_id of each argument to the method. The method stores these object_id's internally in locally scoped (private to the method) variables (named per the method definition's parameter list).

# So Spot's demo_hash is pointing to the munsters hash. In this case, the program does not create a new hash for the result -- it just uses the existing hash as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.

# Question 8 

# puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#
"paper" #==> correct

# Question 9 

def foo(param = "no")
  "yes"
end
#==> will always return "yes" (argument not used)

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo) # ie. bar("yes") #==> "no"
