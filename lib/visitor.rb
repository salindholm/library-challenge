# require '.lib/data.yml'

class Visitor
    attr_accessor :name, :books

    def initialize (name)
        @name = name
        @books = []
    end

    def borrow arg
        missing_library
    end

    def missing_library
        raise 'Library is required'
    end
end
