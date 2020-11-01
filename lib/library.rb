require 'yaml'
require 'date'

class Library
  DATABASE_FILE = './lib/data.yml'
  attr_accessor :books

  def initialize
    @books = YAML.load_file(DATABASE_FILE)
  end

  def search by
    if by[:title] != nil && by[:author] != nil then
      return @books.select { |book| book[:item][:title].include?(by[:title]) && book[:item][:author].include?(by[:author]) }
    end
    if by[:title] != nil then
      return @books.select { |book| book[:item][:title].include? by[:title] }
    end
    if by[:author] != nil then
      return @books.select { |book| book[:item][:author].include? by[:author] }
    end
    return []
  end

  def check_out title
    book = fetch_book(title)
    if found_book?(book) then
      return failure_payload('not found')
    elsif not_available_book?(book) then
      return failure_payload('not available')
    else
      checkout_book = perform_checkout(book)
      update_database
      return success_payload(checkout_book)
    end
  end
  
  def list_of_books
    @books
  end

  private

  def fetch_book(title)
    @books.detect { |book| book[:item][:title] == title }
  end

  def found_book?(book)
    book == nil
  end

  def not_available_book?(book)
    book[:available] == false
  end

  def failure_payload(message)
    { status: false, message: message }
  end

  def success_payload(book)
    { status: true, message: 'success', book: book }
  end

  def perform_checkout(book)
    book[:available] = false
    book[:return_date] = Date.today.next_month(1)
    {
      title: book[:item][:title],
      author: book[:item][:author],
      return_date: book[:return_date]
    }
  end

  def update_database
    File.open(DATABASE_FILE, 'w') { |file| file.write(@books.to_yaml) }
  end
end