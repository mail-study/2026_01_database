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

select * from Orders where custid is null; -- null을 비교할 때 =, >, < 를 사용하지 않는다

select bookid from orders;

select bookid from orders where custid in (select custid from Customer where custid is not null); -- not in 을 사용한다면, 이 조건을 추가하는 것이 안

select bookname from book b1 where b1.price > (select avg(price) from book b2 where b1.publisher = b2.publisher);
-- 상관 부속질의 조건

-- 책을 주문한 횟수가 2회 이상인 고객의 이름을 출력하라
-- 부속 질의 사용
select name
from Customer c
where custid in(select custid from orders o where c.custid = o.custid group by custid having count(*) >=2);

select name from customer where custid in (select custid from Orders);

select name from Customer where address like '%서울' union all select name from Customer where custid in (select custid from orders);

select distinct name from Customer
where address like '%서울%'
and custid in (select custid from orders);

select distinct name from Customer
where address like '%서울%'
and custid not in (select custid from orders);

select name from customer c where exists(
    select custid from orders o where o.custid = c.custid
)

