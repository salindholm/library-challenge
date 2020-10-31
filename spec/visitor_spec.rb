require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:name) {'Sanne'}
    let(:library) { instance_double('Library', books: []) }
    subject {Visitor.new(name)}

    before do 
        allow(library).to receive(:borrow)
        # allow(library).to receive(:books).and_return([])
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
        expect(subject.list_of_books).to be_an(Array)
    end

    it 'is expected to update the books when borrow success' do
        # he would see the list of books that he borrows with the titles, authors and return date
        book_to_be_borrowed = {
            title: "Apple",
            author: "A",
            return_date: Date.today
        }
        title_to_be_borrowed = book_to_be_borrowed[:title]

        subject.books = []

        allow(library).to receive(:borrow).and_return({
            status: true,
            message: "success",
            books: [book_to_be_borrowed]
        })

        expect(library).to receive(:borrow).with([title_to_be_borrowed])
        
        subject.borrow({
            list: [title_to_be_borrowed],
            library: library
        })

        expect(subject.books).to eq [book_to_be_borrowed]
    end

    it 'is expected to updates the books when books not available' do
        title_to_be_borrowed = "Apple"
        subject.books = []
        allow(library).to receive(:borrow).and_return({
            status: false,
            message: "not available",
        })

        expect(library).to receive(:borrow).with([title_to_be_borrowed])
        subject.borrow({
            list: [title_to_be_borrowed],
            library: library
        })
        expect(subject.books).to eq []
    end
end

=begin

data --> library.list_of_books --> visitor
data <-- library.borrow <-- visitor.borrow
data <-- library.return <-- visotor.return

visitor = Visitor.new
visitor
=> {books:[]}
library1 = Library.new "./lib/data1.yaml"
library2 = Library.new "./lib/data2.yaml"
library.list_of_books
=> [{title: "Apple", author: "A", status: :available}, {title: "Banana", author: "B", status: :not_available}]
visitor.borrow(list: ["Apple"], library: library1)
...
-- library should take ["Apple"] # result = library.process(["Apple"])
-- result is {
    status: true,
    message: "success",
    books: [{title: "Apple", author: "A", status: :available}]
   }
-- result is {status: false, message: "not exist / not available"}
status = result[:status]
if status then
    @books = @books + result[:books] # [{A}] + [{B}] => [{A}, {B}]
do

visitor
=> {books: [{title: "Apple", author: "A", status: :available}]}
expect(subject.books).to eq {books: [{title: "Apple", author: "A", status: :available}]}
library
=> {..., list_of_books:[{title: "Apple", author: "A", status: :not_available}, {title: "Banana", author: "B", status: :not_available}]}

=end
