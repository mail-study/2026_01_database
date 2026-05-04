-- subquary 연습
select max(price)
from Book;

select Book.bookname
from Book
where price = (select  max(price) from book);

-- 책을 구매한 적이 있는 고객의 이름을 출력
select name
from Customer
where custid in (select custid from orders); -- 여러행의 결과를 반환하는 subquery는 in 사용 가능

-- 주문 된 적 없는 책의 이름
select bookname
from Book where bookid not in (select bookid from Book);