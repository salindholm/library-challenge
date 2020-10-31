require './lib/visitor.rb'
require 'date'

describe Visitor do
    let(:name) {instance_double ('Sanne')}
    subject {Visitor.new(name)}

    it 'is expected to have a name on initialize' do
        expect(subject.name). to eq name
    end

    it 'is expected to have a list of books on initialize' do
        expect(subject.books). to eq []
    end
end