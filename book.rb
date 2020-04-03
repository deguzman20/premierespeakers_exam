# Find your favarate book
class Book
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call
    find_book
  end

private
  def find_book
    `curl -X GET https://www.googleapis.com/books/v1/volumes?q=#{name}`
  end
end

book = Book.new("harry potter")
pp book.call