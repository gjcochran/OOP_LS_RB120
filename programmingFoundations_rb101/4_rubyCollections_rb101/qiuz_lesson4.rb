# Qs 4-6
def snake(str)
  words = str.split
  current_word = 0 # was set to 1 which meant that first word The wasn't running through the loop and downcasing

  loop do
    words[current_word].downcase!
    # p words[current_word]

    current_word += 1
    break if current_word >= words.size
  end

  words.join("_")
end

def camel(str)
  words = str.split(" ")
  # p words
  counter = 0

  while counter < words.size # needed to be adjusted from > to <
    p words[counter] = words[counter].capitalize

    counter = counter + 1
  end

  words.join
end

def upper_snake(str)
  words = str.split
  current_word = 0

  loop do
    words[current_word].upcase! # needed to go before the iteration so that included the first word
    current_word += 1
    break if current_word == words.size
  end

  words.join("_")
end

def change_case(sentence, new_case)
  case new_case
  when :snake
    snake(sentence)
  when :camel
    camel(sentence)
  when :upper_snake
    upper_snake(sentence)
  else
    puts "Invalid case type"
  end
end

# sentence = "The SKY was blue"
# p snake(sentence) # => 'the_sky_was_blue'

# sentence = "The sky was blue"
# p camel(sentence) # => 'TheSkyWasBlue'

sentence = "The sky was blue"
p upper_snake(sentence) # => 'THE_SKY_WAS_BLUE'

# Q20

mailing_campaign_leads = [
  {
    name: "Emma Lopez",
    email: "emma.lopez@some_mail.com",
    days_since_login: 423,
    mailing_list: true,
  },
  {
    name: "mike richards",
    email: "michael.richards@some_mail.com",
    days_since_login: 23,
    mailing_list: false,
  },
  {
    name: "JANE WILLIAMS",
    email: "jane_w95@my_mail.com",
    days_since_login: 16,
    mailing_list: true,
  },
  {
    name: "Ash Patel",
    email: "ash_patel@my_mail.com",
    days_since_login: 22,
    mailing_list: true,
  },
]

# counter = 0

# loop do
#   break if counter == mailing_campaign_leads.size
#   full_name = mailing_campaign_leads[counter][:name]
#   names = full_name.split

#   names_counter = 0
#   loop do
#     break if names_counter == names.size
#     name = names[names_counter]
#     names[names_counter] = name.capitalize

#     names_counter += 1
#   end

#   capitalized_full_name = names.join(" ")
#   mailing_campaign_leads[counter][:name] = capitalized_full_name

#   counter += 1
# end

# usable_leads = []
# counter = 0

# loop do
#   break if counter == mailing_campaign_leads.size
#   last_login = mailing_campaign_leads[counter][:days_since_login]
#   subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

#   if last_login < 60 && subscribed_to_list
#     usable_leads << mailing_campaign_leads[counter]
#   end

#   counter += 1
# end

# p usable_leads
#==>
# [{:name=>"Jane Williams", :email=>"jane_w95@my_mail.com", :days_since_login=>16, :mailing_list=>true},
#   {:name=>"Ash Patel", :email=>"ash_patel@my_mail.com", :days_since_login=>22, :mailing_list=>true}]

# goal of this algo is 1. to reformat all names, then 2. to take a lead list and filter for usable leads. counts leads as usable if they have logged in within 60 days and are subscribed to the mailing list, then adds to a new array
