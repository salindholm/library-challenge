require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:name) {'Sanne'}
    let(:library) {instance_double ('Library', books: [])}
    subject {Visitor.new(name)}

    before do 
        allow(library).to receive(:borrow)
        allow(library).to receive(:books).and_return([])
    end

    it 'is expected to have a name on initialize' do
        expect(subject.name). to eq name
    end

    it 'is expected to have a list of books on initialize' do
        expect(subject.books). to eq []
    end

    it 'is expected to raise an error if there is no library' do
        expect{ subject.borrow({}) }.to raise_error ('Library is required')
    end

   it 'is expected to raise an error if there is no list of books' do
       expect{ subject.borrow({library: library}) }.to raise_error ('List of books is required')
    end

   it 'is expected to have a list of books' do
    # he would see a list of books with titles and authors and maybe avalibility(true/false)
    expect(subject.list_of_books).to be_an(String)
    end

    it 'is expected to update the booklist' do
        # he would see the list of books that he borrows with the titles, authors and return date
    end

end