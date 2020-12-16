1. Obtain information (editor id, editor first name, editor last name) of the editors
who have edited the book whose ISBNCode is ‘8330418998’.

select e.eid, e.fname, e.lname
from Editor as e, Edited_by as eb
where  eb.isbn = '8330418998' and e.eid = eb.eid;



2. Retrieve the customers’ names who bought novels. Order the result in the
descending order of customer name. (Book type is novel).

select c.name
from Customer as c, Orders as o, Order_book as ob, Book as b
where c.cid = o.cid and o.oid = ob.oid and ob.isbn = b.isbn and b.btype = 'novel'
order by c.name desc;



3. Get all publishers information (publisher name, address) which have published
textbooks. If a publisher published more than one book, list the publisher only
once in your result.

select p.name, p.address
from Publisher as p, Book as b
where b.btype = 'textbook' and p.pid = b.pid
group by p.name;



4. Retrieve the author Id, author’s first name, author’s last name, and number of
novel books written, if an author has written more than 2 novel books. Both
sole-authoring and co-authoring activities should be considered as writing a
book.

select a.aid, a.fname, a.lname, count(*)
from Author as a, Written_by as wb, Book as b
where a.aid = wb.aid and wb.isbn = b.isbn and b.btype = 'novel'
group by a.aid, a.fname, a.lname;



5. Get authors information (first name, last name) who has written the book
‘Fundamentals of Database Systems’.

select a.fname, a.lname
from Author as a, Written_by as wb, Book as b
where b.title = 'Fundamentals of Database Systems' and wb.isbn = b.isbn and a.aid = wb.aid;



6. Get the books information (title, type and ISBN) written by author ‘Jeff Smith’.

select b.title, b.btype, b.isbn
from Book as b, Author as a, Written_by as wb
where a.fname = 'Jeff' and a.lname = 'Smith' and wb.aid = a.aid and wb.isbn = b.isbn;



7. Get information (publisher id, publisher name, phone) about publishers who have
published more than 2 novels.

select p.pid, p.name, p.phone
from Publisher as p, Book as b
where b.btype = 'novel' and b.pid = p.pid
group by p.pid
having count(*) > 2;



8. Obtain the highest price of the books that are written by author “Jeff Smith”. List
the price.

select max(b.price) as price
from Book as b, Written_by as wb, Author as a
where a.fname = 'Jeff' and a.lname = 'Smith' and a.aid = wb.aid and wb.isbn = b.isbn;



9. List the editor Id and number of books edited, if the editor has edited more than 2
books. Both sole-editing and co-editing activities should be considered as editing
a book.

select e.eid, count(*) as count
from Editor as e, Edited_by as eb
where eb.eid = e.eid
group by e.eid;



10. List all orders (order_id, order date) that ordered by customer named “Alice
Kay”;

select o.oid, o.order_date
from Orders as o, Customer as c
where c.name = 'Alice Kay' and o.cid = c.cid;



11. List all books (ISBN, title, price) that are ordered by customer named “Alice
Kay”. If she ordered the same book more than once or more than one copy,
please only display the book once in the result. Order the result by book title in
ascending order.

select b.isbn, b.title, b.price
from Book as b, Orders as o, Customer as c, Order_book as ob
where c.name = 'Alice Kay' and o.cid = c.cid and o.oid = ob.oid and ob.isbn = b.isbn
group by b.isbn
order by b.title desc;



12. List all the orders (order_no, order date) that include “Fundamentals of Database
Systems”.

select o.oid, o.order_date 
from Orders as o, Order_book as ob, Book as b
where b.title = 'Fundamentals of Database Systems' and ob.isbn = b.isbn and o.oid = ob.oid;



13. List how many orders are placed before “2019-08-11’.

select count(*) as count
from Orders as o
where o.order_date < '2019-08-11';



14. For customers who had made more than 2 orders so far, list customer Id,
customer name, and number of orders that the customer has made.

select c.cid, c.name, count(*) as count
from Customer as c, Orders as o
where o.cid = c.cid
group by c.cid
having count(*) > 2;



15. Retrieve book (or books) that has(have) the highest price among all books.
Please list book tile and price.

select title, price
from Book
where (
    select max(price)
    from Book
) = price;
