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


-- member 생년월일, 성별, 주소, 주소디테일

select
	 a.seq
    ,a.dob
    ,a.gender
    ,b.seq
    ,b.address
    ,b.addressDetail
from member a
 left join transport b on b.member_seq = a.seq
-- inner join review b on b.classProduct_seq = a.seq
-- join review b on b.classProduct_seq = a.seq
;

-- member 생년월일 1989년, 성별 남성, 주소 서울시 사는 사람

select
	 a.seq
    ,a.name
    ,a.dob
    ,a.gender
    ,b.member_seq
    ,b.address
  from member a
 left join transport b on b.member_seq = a.seq
-- inner join review b on b.classProduct_seq = a.seq
-- join review b on b.classProduct_seq = a.seq
where 1=1
and a.dob like "1989%"
and a.gender like 4
and b.address like "서울시%"
;

-- member 서울사는 크리에이터 여성

select 
	a.seq
    ,a.name
    ,a.gender
    ,a.position
    ,b.member_seq
    ,b.address
  from member a
  left join transport b on b.member_seq = a.seq
  
  where
  1=1
	and a.gender like 5
	and a.position like 23
    and b.address like "서울%"
  ;


-- member 서울시 마포구 사는 수강생 남성

select 
	a.seq
    ,a.name
    ,a.gender
    ,a.position
    ,b.member_seq
    ,b.address
  from member a
  left join transport b on b.member_seq = a.seq
  
  where
  1=1
	and a.gender like 4
	and a.position like 22
    and b.address like "서울시 마포구%"
  ;

-- member : skt 쓰는 마포구 사는 사람

select 
	 a.seq
	,a.name
    ,a.telCompany
    ,b.member_seq
    ,b.address
from member a 
left join transport b on b.member_seq = a.seq

where
1=1
and a.telCompany like 1
and b.address like "%마포구%" 
;

-- member 서울시에 사는 90년대 생들

select
	 a.seq
	,a.name
    ,a.gender
    ,a.dob
    ,b.member_seq
    ,b.address
 from member a
 left join transport b on b.member_seq = a.seq
 
 where
 1=1
 and a.dob like '199%'
 and b.address like '서울시%'
 ;
 
 -- member: 이메일에  y가 들어가는 서울 사는 여성

select 
	a.seq
    ,a.name
    ,a.gender
    ,a.email
    ,b.member_seq
    ,b.address
    
from member a
left join transport b on b.member_seq = a.seq

where 
1=1
and a.email like '%y%'
and a.gender like 5
and b.address like "서울시%"
;

