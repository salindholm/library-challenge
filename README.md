# Library Challenge

## Description

**Library**:
Our code is written to allow the library to be able to be searched books by title, by author or by both using `library.search(title: 'Title', author: 'Author')`.

**Visitor**:
The code that written in the Visitor class are supposed to allow visitors to see the library's books by query `library.list_of_books` and to checkout a book using `visitor.borrow(title: 'Titile', library: library)`. 

## User Stories

```
As a visitor,
In order to borrow a book,
I want to be able to have a list books with titles and authors.
```

```
As a visitor,
In order to return a book,
I would like to be able to know a return date.
```

```
As a library operator,
In order to keep track of books,
I would like to be able to search a book by title, author and by both.
```

## Setup

You need to have Ruby on your machine and clone this repo.

## Instructions

- Step 1: Open your Terminal and then type `irb` command for Interactive Ruby Shell
- Step 2: Type the code as followed,
  
```
load './lib/library.rb'
load './lib/visitor.rb'

library = Library.new
visitor = Visitor.new('Sanne')

library.search(title: 'Stone')

=> [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

library.search(author: 'Rowling')

=> [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Prisoner of Azkaban", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Goblet of Fire", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Order of the Phoenix", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Half-Blood Prince", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Deathly Hallows", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

library.library.search(title: 'Stone', author: 'Rowling')

=> [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

visitor.borrow(title: 'Harry Potter and the Philosopher\'s Stone', library: library)

=> "success"

visitor

=> #<Visitor:0x00007fa4ca0cccd8 @name="Luna", @books=[{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling", :return_date=>#<Date: 2020-12-02 ((2459186j,0s,0n),+0s,2299161j)>}]> 
```

## Acknowlegments
- Course material from [Craft Academy](https://www.craftacademy.se/english/)
- [Save data to file from StackoOverflow](https://stackoverflow.com/a/2777863)
- [Convert Array or Hash object to YAML format](https://stackoverflow.com/a/17576810)
- [Oneline `if` statement in Ruby](https://stackoverflow.com/a/42308805)
- [Use a double for an instance variable of an object in Rspec](https://stackoverflow.com/questions/39815538/use-a-double-for-an-instance-variable-of-an-object-in-rspec)
- Mr.Puthnith Var

## Improvement plans
- To implement `checkin` on Library class and `return_book` on Visitor class.
- Our current implementation does not reset the database. Once a book is borrowed, the database is updated to be not available. Therefore, we need to manually set it back to available to run `irb` again. So we will implement the `reset` method on Library class.
- To refactor the `borrow` method to allow visitor to borrow multiple books at once.

## License
MIT License 
