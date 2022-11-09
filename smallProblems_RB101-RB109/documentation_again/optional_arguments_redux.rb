require "date"

puts Date.civil #==> default (ie) # -4712-01-01
puts Date.civil(2016) #==> 2016-01-01
puts Date.civil(2016, 5) #==> 2016-05-01
puts Date.civil(2016, 5, 13) #==> 2016-05-13

# https://ruby-doc.org/stdlib-3.1.2/libdoc/date/rdoc/Date.html#
# https://ruby-doc.org/stdlib-3.1.2/libdoc/date/rdoc/Date.html#method-c-civil
