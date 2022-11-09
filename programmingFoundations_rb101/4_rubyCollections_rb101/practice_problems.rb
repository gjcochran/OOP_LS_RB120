puts " --------- 1 ---------- "
# What is the return value of the select method below? Why?

p [1, 2, 3].select do |num|
  num > 5
  "hi"
end
# my answer: the return value is 'hi'
# partially correct but incomplete

# LS answer: #==> [1, 2, 3] # select performs selection based on the truthiness of the block's return value. In this case the return value will always be 'hi', which is a "truthy" value. Therefore select will return a new array containing all of the elements in the original array.

puts " --------- 2 ---------- "
# How does count treat the block's return value? How can we find out?

p %w[ant bat caterpillar].count { |str| str.length < 4 }
# my answer: provides the number of values that are less than 4 characters in length, in this case 2
# correct!

#==> 2
# LS answer: If we don't know how count treats the block's return value, then we should consult the docs for Array#count. Our answer is in the description:

# returns the count of elements for which the block returns a truthy value:

# Based on this information, we can conclude that count only counts an element if the block's return value evaluates as true. This means that count considers the truthiness of the block's return value.

puts " --------- 3 ---------- "
# What is the return value of reject in the following code? Why?

p [1, 2, 3].reject { |num| puts num }
# my answer: was unfamiliar with Array#reject, so looked to ruby docs...
# Returns a new Array whose elements are all those from self for which the block returns false or nil
# all elements in this array are truthy so i think will return an empty array
# was wrong ... #==> [1, 2, 3] # didnt consider how puts changes, without puts would be an empty array

# LS answer: Since puts always returns nil, you might think that no values would be selected and an empty array would be returned. The important thing to be aware of here is how reject treats the return value of the block. reject returns a new array containing items where the block's return value is "falsey". In other words, if the return value was false or nil the element would be selected.

p [1, 2, 3].reject { |num| num } #==> []

puts " --------- 4 ---------- "
# What is the return value of each_with_object in the following code? Why?

%w[ant bear cat].each_with_object({}) { |value, hash| hash[value[0]] = value }
#==> i think the value[0] is referring the the first letter of each word
# { a: 'ant', b: 'bear', c: 'cat' }
#correct!

puts " --------- 5 ---------- "
# What does shift do in the following code? How can we find out?

hash = { a: "ant", b: "bear" }
hash.shift
# .shift will remove the first pair from the hash
p hash #==> {:b=>"bear"}
# correct

puts " --------- 6 ---------- "
# What is the return value of the following statement? Why?

p %w[ant bear caterpillar].pop.size
# pop premanently removes the last element and size returns the number of elements therefore will return 2
# incorrect! .size is being called on the element that was popped off the array and is not determining the number of elements but rather than number of characters. there are 11 characters in caterpillar so the answer is 11

p %w[ant bear].size #==> 2

puts " --------- 7 ---------- "
# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

p [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the question is.. does this method ignore the puts num returning nil and instead only focus on the line 71, num.odd? ?
# if was just num.odd? then would return true because there are odd elements in the array...

# LS answer:
# The return value of the block is determined by the return value of the last expression within the block. In this case the last statement evaluated is num.odd?, which returns a boolean. Therefore the block's return value will be a boolean, since Integer#odd? can only return true or false.

#   Since the Array#any? method returns true if the block ever returns a value other than false or nil, and the block returns true on the first iteration, we know that any? will return true. What is also interesting here is any? stops iterating after this point since there is no need to evaluate the remaining items in the array; therefore, puts num is only ever invoked for the first item in the array: 1

puts " --------- 8 ---------- "
arr = [1, 2, 3, 4, 5]
p arr.take(2)
# unsure how take works and if is destructure so looked the Array docs
# https://ruby-doc.org/core-3.1.2/Array.html#method-i-take
# "Returns a new Array containing zero or more leading elements of self; does not modify self." therefore is not destructive
#==> [1, 2] # correct

puts " --------- 9 ---------- "
# What is the return value of map in the following code? Why?

p ({ a: "ant", b: "bear" }.map { |key, value| value if value.size > 3 })
# will return 'bear'
# incorrect #==> [nil, "bear"] # bear was the output, not the return
# LS answer:There are some interesting things to point out here. First, the return value of map is an array, which is the collection type that map always returns. Second, where did that nil come from? If we look at the if condition (value.size > 3), we'll notice that it evaluates as true when the length of value is greater than 3. In this case, the only value with a length greater than 3 is 'bear'. This means that for the first element, 'ant', the condition evaluates as false and value isn't returned.

# When none of the conditions in an if statement evaluates as true, the if statement itself returns nil. That's why we see nil as the first element in the returned array.

puts " --------- 10 ---------- "
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# [nil, 2, 3] # incorrect! smh
# output:
# 2
# 3
# return:
# [1, nil, nil]
