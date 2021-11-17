require './book'

class HandleBooks
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    @books << Book.new(title: title, author: author)
    puts 'Book is created succussfully'
  end

  def list_of_books
    if @books.size.zero?
      puts 'No books'
    else
      puts "List of all books: \n"
      @books.each_with_index { |book, index| puts "#{index + 1}- Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
