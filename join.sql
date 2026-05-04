SELECT *
From customer, orders; -- 카티션 프로덕트, 두 테이블을 무조건 연결

-- join은 주로 참조하는 테이블의 외래키와 참조되는 테이블의 기본키를 연결
select *
from orders, Book
where orders.bookid = book.bookid;

-- 두 테이블에 모두 존재하는 컬럼 이름의 경우, 테이블 이름을 명시해야함.
select o.orderid, b.bookid, bookname, price
from orders o, book b -- 이 SQL 문장 내에서 사용할 테이블의 별명
where o.bookid = b.bookid;

-- 책을 주문한 고객의 이름을 중복을 삭제하여 출력하라.
select distinct c.name
from Customer c, Orders o
where c.custid = o.orderid;

-- 판매 가격 (salse price)이 10000원 이상인 책을 주문한 주문번호와 책이름
select o.orderid, b.bookname, o.saleprice
from orders o, book b
where o.saleprice >= 10000 and o.bookid = b.bookid
order by orderid;

-- 책의 판매 가격의 합이 30000원 이상인 책의 이름과 판매 가격의 합
select sum(saleprice), b.bookname -- 집계함수이거나, group by에 나타난 컬럼
from book b, Orders o
where b.bookid = o.bookid -- join 조건
group by bookname -- 책의 이름별 판매가격을 출력해야 하므로.
having sum(o.saleprice) >= 20000; -- group의 조건

-- 고객의 이름과 고객이 주문한 도서의 이름
select b.bookname, c.name
from book b, orders o, Customer c
where b.bookid = o.orderid and o.custid = c.custid -- 테이블 3개 연결
order by c.name;

-- 판매된 도서의 개수가 3개 이상인 출판사와 판매된 도서의 수를 판매를 많이 한 출판사부터 출력하라
select count(o.bookid), b.publisher
from book b, orders o
where o.bookid = b.bookid
group by publisher having count(o.bookid) >= 3 -- 출판사 기준으로 묶고, 주문된 책 번호를 센다
order by count(bookid) desc;

-- join을 표기하는 다른 방법
select o.orderid, b.bookname, o.saleprice
from orders o, book b
where o.bookid = b.bookid;

-- 명시적으로 join과 on을 이용하여 표기
select orderid, bookname
from book b join Orders o on b.bookid = o.bookid;

-- 주문한 적이 있는 고객 id와 고객의 이름을 id가 증가하도록 중복 없이 출력하라. join을 명시적으로 사용하라
select distinct c.name, o.custid
from Customer c join orders o on c.custid = o.custid -- 가장 일반적인 표현 방법, 가장 일반적임
order by o.custid;

-- using 사용 가능 : 두 테이블에 같은 이름의 컬럼을 join 할 때 사용 가능
select distinct name, custid
from Customer c join orders o using(custid) -- 두 테이블의 같은 이름의 컬럼을 사용
order by custid;

-- 굿스포츠 에서 발간한 책의 이름과 판매 가격 (saleprice) 을 출력하라. using을 이용하여 출력
select bookname, saleprice
from book b join orders o using(bookid)
where b.publisher = '굿스포츠'; -- tuple의 조건

-- 자연 조인은 두 테이블을의 이름이 같은 컬럼을 무조건 연결, on, using 사용하지 않음
