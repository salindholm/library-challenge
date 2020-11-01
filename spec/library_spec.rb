require './lib/library.rb'
require 'date'

describe Library do

  let (:books) { YAML.load_file('./lib/data.yml') }

  it 'is expected to have books on initialized' do
    expect(subject.books).to eq books
  end

  it 'is able to search books by titles' do
    found_book = {item: {title: 'Harry Potter and the Philosopher\'s Stone', author: 'J.K. Rowling'}}
    subject.books = [
      found_book,
      {item: {title: 'Harry Potter and the Prisoner of Azkaban', author: 'J.K. Rowling'}}
    ] 
    result = subject.search({title:'Stone'})
    expect(result).to eq [found_book]
  end
  
  it 'is able to search books by authors' do
    found_book = {item: {title: 'Men without Women', author: 'Haruki Murakami'}}
    subject.books = [
      found_book,
      {item: {title: 'Harry Potter and the Prisoner of Azkaban', author: 'J.K. Rowling'}}
    ]
    result = subject.search({author: 'Murakami'})
    expect(result).to eq [found_book]
  end
  
  it 'is able to search books by titles and authors' do
    found_book = {item: {title: 'Harry Potter and the Philosopher\'s Stone', author: 'J.K. Rowling'}}
    subject.books = [
      found_book,
      {item: {title: 'The Stone Book', author: 'Alan Garner'}},
      {item: {title: 'Harry Potter and the Prisoner of Azkaban', author: 'J.K. Rowling'}}
    ]
    result = subject.search({title: 'Stone', author: 'Rowling'})
    expect(result).to eq [found_book]
  end
  
  it 'returns empty array if no title or author provided to search' do
    subject.books = [
      {item: {title: 'Harry Potter and the Philosopher\'s Stone', author: 'J.K. Rowling'}},
      {item: {title: 'Harry Potter and the Prisoner of Azkaban', author: 'J.K. Rowling'}}
    ]
    result = subject.search({})
    expect(result).to eq []
  end
  
  it 'is expected to provide a list of books' do
    expect(subject.list_of_books).to eq books
  end
end