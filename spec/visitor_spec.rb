require './lib/visitor.rb'
require 'date'

describe Visitor do

    let (:library) { instance_double('Library', availability: true, return_date: 21/11/20) }
    
    

    it 'to see the available books' do
        expect(subject.books).to eq 8
    end

end