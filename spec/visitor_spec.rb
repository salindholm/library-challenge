require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:name) {'Sanne'}
    let(:library) { instance_double('Library', books: []) }
    subject {Visitor.new(name)}

    before do 
        allow(library).to receive(:check_out)
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

    it 'is expected to update the books when borrow is success' do
        book_to_be_borrowed = {
            title: "Apple",
            author: "A",
            return_date: Date.today.next_month(1)
        }
        title_to_be_borrowed = book_to_be_borrowed[:title]

        subject.books = []

        allow(library).to receive(:check_out).and_return({
            status: true,
            message: "success",
            book: book_to_be_borrowed
        })

        expect(library).to receive(:check_out).with(title_to_be_borrowed)
        
        subject.borrow({
            title: title_to_be_borrowed,
            library: library
        })

        expect(subject.books).to eq [book_to_be_borrowed]
    end

    it 'is expected to updates the books when borrow is failure' do
        title_to_be_borrowed = "Apple"
        subject.books = []
        allow(library).to receive(:check_out).and_return({
            status: false,
            message: "not available",
        })

        expect(library).to receive(:check_out).with(title_to_be_borrowed)
        subject.borrow({
            title: title_to_be_borrowed,
            library: library
        })
        expect(subject.books).to eq []
    end
end

