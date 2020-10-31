# require '.lib/data.yml'

class Visitor
    attr_accessor :name, :books

    def initialize (name)
        @name = name
        @books = []
    end

    def borrow arg # has to be {list: ..., library: ...}
        missing_library arg[:library]
        missing_books arg[:list]
        library = arg[:library]
        list = arg[:list]
        result = library.borrow(list)
        if result[:status] == true then
            @books += result[:books]
        end
        result[:message]
    end

    def missing_library library
        raise 'Library is required' if library == nil
    end

    def list_of_books
        books
    end

   def missing_books list
       raise 'List of books is required' if list == nil
   end
end
