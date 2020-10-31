require './lib/library.rb'
require 'date'

describe Library do

  it 'is expected to have books on initialized' do
    books = YAML.load_file('./lib/data.yml')
    expect(subject.books).to eq books
  end

  it 'is expected to checkout books if available' do
    
  end

end