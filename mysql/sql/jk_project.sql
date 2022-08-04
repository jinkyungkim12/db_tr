use fruit;

-- cc. ccgName. cc. ccname

select
	 a.seq
    ,a.Name
    ,b.seq
    ,b.name
from CommonCodeGroup a
 left join CommonCode b on b.CommonCodeGroup_seq = a.seq
-- inner join review b on b.classProduct_seq = a.seq
-- join review b on b.classProduct_seq = a.seq
;


-- 로그인

select * from member where id="kangsong" and password="songsasda";
select * from member where id="suzybae" and password="suzy121235yzus";
select * from member where id="bogum" and password="qhrja57865";

-- 배송 zipcode: 30512, 10570, 78974

select * from transport where zipcode="30512";
select * from transport where zipcode="10570";
select * from transport where zipcode="78974";

-- 배송지: 강남구/ 마포구/ 아파트

select * from transport where address like "%서울시 강남구%";
select * from transport where address like "%서울시 마포구%";
select * from transport where addressDetail like "%아파트%";


-- 회원가입

select * from where






-- 