require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:name) {'Sanne'}
    let(:library) { instance_double('Library', books: []) }
    subject {Visitor.new(name)}

    before do 
        allow(library).to receive(:check_out)
        # allow(library).to receive(:books).and_return([])
    end

    it 'is expected to have a name on initialize' do
        expect(subject.name). to eq name
    end

    it 'is expected to have a list of books on initialize' do
        expect(subject.books). to eq []
    end

    it 'is expected to raise an error if there is no library' do
        expect{ subject.check_out({}) }.to raise_error ('Library is required')
    end

    it 'is expected to raise an error if there is no list of books' do
       expect{ subject.check_out({library: library}) }.to raise_error ('List of books is required')
    end

    it 'is expected to have a list of books' do
        expect(subject.list_of_books).to be_an(Array)
    end

    it 'is expected to update the books when checkout success' do
        book_to_be_checkout = {
            title: "Apple",
            author: "A",
            return_date: Date.today.next_month(1)
        }
        title_to_be_checkout = book_to_be_checkout[:title]

        subject.books = []

        allow(library).to receive(:check_out).and_return({
            status: true,
            message: "success",
            books: [book_to_be_checkout]
        })

        expect(library).to receive(:check_out).with([title_to_be_checkout])
        
        subject.check_out({
            list: [title_to_be_checkout],
            library: library
        })

        expect(subject.books).to eq [book_to_be_checkout]
    end

    it 'is expected to updates the books when checkout not success' do
        title_to_be_checkout = "Apple"
        subject.books = []
        allow(library).to receive(:check_out).and_return({
            status: false,
            message: "not available",
        })

        expect(library).to receive(:check_out).with([title_to_be_checkout])
        subject.check_out({
            list: [title_to_be_checkout],
            library: library
        })
        expect(subject.books).to eq []
    end
end

