# Library Challenge

## The code
**Library**

Our code is written to allow the library to be able to search books by title, by author and by both.

**Visitor**

The codes that written in the Visitor class are supposed to allow visitors to have access to see a list of books and to checkout books. 

```
As a visitor
In order to borrow a book
I want to be able to have a list books with titles and authors
```
```
As a visitor 
In order to return a book
I would like to be able to know a return date
```
```
As a library operator
In order to keep track of books
I would like to be able to search a book by title, author and by both
```
## Setup
You need to have Ruby on your machine and clone this repo.

## Instructions

- Step 1: Open your Terminal and then type `irb` command for Interactive Ruby Shell
- Step 2: Type the code as followed,
  
```Ruby
load '.lib/library.rb'
library = Library.new
library.search(title: 'Stone')

 => [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

library.search(author: 'Rowling')

=> [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

 => [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Chamber of Secrets", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Prisoner of Azkaban", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Goblet of Fire", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Order of the Phoenix", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Half-Blood Prince", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}, {:item=>{:title=>"Harry Potter and the Deathly Hallows", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

 library.library.search(title: 'Stone', author: 'Rowling')

 => [{:item=>{:title=>"Harry Potter and the Philosopher's Stone", :author=>"J.K. Rowling"}, :available=>true, :return_date=>nil}] 

```
## Acknowlegments 
Learning materials from craft academy

Our teammates

## Implementations 
- We have not fully finished the 'Checkout' method where the visitor can checkout the books with the return date. Therefor, we hope to make that implementation happen with efficiency and reliability.

## License

MIT License 
