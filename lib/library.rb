require 'yaml'
require 'date'

class Library
  attr_accessor :books

  def initialize
    @books = YAML.load_file('./lib/data.yml')
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

  def list_of_books
    @books
  end
  
end