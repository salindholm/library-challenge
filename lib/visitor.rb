# require '.lib/data.yml'

class Visitor
    attr_accessor :name, :books

    def initialize (name)
        @name = name
        @books = []
    end

    
end
