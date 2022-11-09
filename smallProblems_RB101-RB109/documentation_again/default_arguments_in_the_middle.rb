def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# https://docs.ruby-lang.org/en/master/syntax/methods_rdoc.html#label-Default+Values
# b = 2 and c = 3 are default arguments

# i suspect c #==> [4, 5, 3, 6]

# https://ruby-doc.org/core-3.1.2/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments
# ^^^ explains it well, my initial hunch was correct
# First 4 is assigned to a, then 6 is assigned to d. This leaves only the arguments with default values. Since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3.
