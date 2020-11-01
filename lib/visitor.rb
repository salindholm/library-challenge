class Visitor
    attr_accessor :name, :books

    def initialize (name)
        @name = name
        @books = []
    end

    def borrow request
        missing_library request[:library]
        missing_books request[:title]
        result = request[:library].check_out(request[:title])
        if result[:status] == true then
            @books << result[:book]
        end
        result[:message]
    end

    def missing_library library
        raise 'Library is required' if library == nil
    end

    def missing_books list
       raise 'List of books is required' if list == nil
    end
end
