class Library
  attr_reader :shelf

  def initialize
    @shelf = [] 
  end

  def add_to_shelf(book)
    shelf << book
  end
end

class Book
  def initialize(name, author, genre)
    @name = name
    @author = author
    @genre = genre
  end
end

way_of_kings = Book.new("Way of Kings", "Brandon Sanderson", "Fantasy")
eloquent_ruby = Book.new("Eloquent Ruby", "Russ Olsen", "Non-Fiction")
local_library = Library.new
local_library.add_to_shelf(way_of_kings)
local_library.add_to_shelf(eloquent_ruby)
p local_library.shelf
