
-- 주문한 적이 없는 고객을 포함하며, 고객의 이름과 해당 고객이 주문한 책의 이름을 출력
select c.name, b.bookname
from Customer c left outer join Orders o using(custid)
left outer join Book b using(bookid);

-- right outer join을 사용
select c.name, b.bookname
from book b join orders o using(bookid)
right join Customer c using(custid); -- outer는 생략 가능

-- mysql은 full outer join을 직접적으로 제공하지 않는다

