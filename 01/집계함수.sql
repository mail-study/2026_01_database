select sum(all saleprice)
from Orders;

-- 평균 계산

select avg(saleprice)
from orders;

-- 집게 함수에서 distinct는 값의 중복을 제거하고 계산
select avg(distinct saleprice)
from Orders;

-- 갯수 세기
-- 값을 가진 모든 샛수
select count(all saleprice)
from Orders;

-- 서로 다른 값으 ㅣ갯수
select count(distinct saleprice)
from Orders;

select sum(saleprice) as total_price from Orders
where custid = 2;

-- 그루핑 연습
-- 고객별 주문한 도서의 총수량을 구하라
select custid, count(*) as total_count
from Orders
group by custid;
-- grouping 했을 때는 selsct 절에 grouping attribute (예 : custid) 집계함수가 올 수 있다

-- 아래 질의는 잘 작동함
select custid, count(*), sum(saleprice)
from Orders
group by custid;

-- 아래 질의에서 bookid는 grouping attribute가 아니므로, 포함 불가능.
select custid, count(*), bookid, sum(saleprice)
from Orders
group by custid;

-- 아래 질의는 잘 작동함, where는 튜플의 조건이니까, 튜플 전체에 대한 조건을 검사함, 튜플에 적용할 수 있는 모든 조건 명시 가능
select custid, count(*), sum(saleprice)
from orders
where bookid