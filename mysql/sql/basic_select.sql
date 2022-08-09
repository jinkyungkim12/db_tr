membermemberuse fruit;

select * from member;

select count(*) from member;

select
	a.member_seq
    ,a.zipcode
    ,a.address
    ,b.seq
from transport a
-- left join member b on b.seq = a.member_seq
inner join member b on b.seq = a.member_seq
-- join member b on b.seq = a.member_seq
;

select
	a.category
    ,a.title
    ,a.seq
    ,b.classProduct_seq
    ,b.reviewDate
from classProduct a
 left join review b on b.classProduct_seq = a.seq
-- inner join review b on b.classProduct_seq = a.seq
-- join review b on b.classProduct_seq = a.seq
;

-- where 1=1

-- order by

-- group by

-- union


-- 로그인
select * from member where id="" and password=""; 