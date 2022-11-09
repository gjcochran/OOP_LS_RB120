# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# P
# 1. can i assume all inputs are strings?

# input: string
# output: array of substrings
# Requirements:
#   - write a method 'palindrome_substrings'
#   - method to return all substrings from input that are palindromes
#   - palindromes are case sensitive
#   - [IMPLICIT] if the string is an empty string, the result should be an empty array

# D
# use an array b/c that is the desired output

# A

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious") # ["ili"]
p palindrome_substrings("abcddcbA") # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") # []
p palindrome_substrings("") # []
