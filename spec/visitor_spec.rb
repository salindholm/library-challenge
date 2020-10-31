require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:name) {instance_double ('Sanne')}
    let(:library) {instance_double ('Library')}
    subject {Visitor.new(name)}

    it 'is expected to have a name on initialize' do
        expect(subject.name). to eq name
    end

    it 'is expected to have a list of books on initialize' do
        expect(subject.books). to eq []
    end

    it 'is expected to raise an error if there is no library' do
        expect{ subject.borrow({}) }.to raise_error ('Library is required')
    end

end