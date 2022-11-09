#each
p [1, 2, 3].each { |num| num } #==> [1, 2, 3]

#select
p [1, 2, 3].select { |num| num.odd? } #==> [1, 3]

#map
p [1, 2, 3].map { |num| num * 2 } #==> [2, 4, 6]

#any?

p [1, 2, 3].any? { |num| num > 2 } #==> true

#all?

p [1, 2, 3].all? { |num| num > 2 } #==> false

p ({ a: "ant", b: "bear", c: "cat" }.all? { |key, value| value.length >= 3 }) #==> true

#each_with_index

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}"
end
# ==>
# The index of 1 is 0
# The index of 2 is 1
# The index of 3 is 2

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}"
end
#==>
# The index of [:a, "ant"] is 0
# The index of [:b, "bear"] is 1
# The index of [:c, "cat"] is 2

#each_with_object

p [1, 2, 3].each_with_object([]) { |num, array| array << num if num.odd? } #==> [1, 3]

p (
    { a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
      array << pair.last
    end
  )
#==> ["ant", "bear", "cat"]

p (
    { a: "ant", b: "bear", c: "cat" }.each_with_object(
      {},
    ) do |(key, value), hash| hash[value] = key end
  )
#==> {"ant"=>:a, "bear"=>:b, "cat"=>:c}

#first

p [1, 2, 3].first #==> 1

#include?

p [1, 2, 3].include?(1) #==> true
# when called on a hash, #include? only checks the keys, not the values ... just use Hash#key? instead

#partition

p [1, 2, 3].partition { |num| num.odd? } #==> [[1, 3], [2]]

odd, even = [1, 2, 3].partition { |num| num.odd? }
p odd #==> [1, 3]
p even #==> [2]
