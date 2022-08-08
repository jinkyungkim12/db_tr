use fruit;

-- cc. ccgName. cc. ccname
-- 공통코드 
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


-- 로그인/ 아이디, 비번 찾기!!

select
	name
    ,id
    ,password
from member 
where id="kangsong" and password="songsasda"
;

-- 메인 오늘의 특가

select 
	classDiv,
    category,
    title,
    discountRate,
    price,
    payMonth
from classProduct
where
1=1
and classDiv="25"
and category="굿즈,이모티콘"
and title="이모티콘 작가와 함께, 쉽게 배우는 이모티콘"
and discountRate=40
and price=286000
and payMonth=16
;

-- 메인 MD 추천 클래스

select 
	classDiv,
    category,
    title,
    discountRate,
    price,
    payMonth
from classProduct
where
1=1
and classDiv="26"
and category="근영쌤"
and title="영어 회화 1위 근영쌤의 '유창한 회화로 바로 뱉는 100% 진짜 단어 공부법'"
and discountRate=19
and price=219400
and payMonth=16
;




-- 제품 상세

-- 제품 상세 , 후기














-- 배송지: 강남구, 아파트 사는 사람

select 
	a.seq
    ,a.name
    ,a.id
    ,b.member_seq
    ,b.address
    ,b.addressDetail
from member a
left join transport b on b.member_seq = a.seq
where
1=1
and b.address like "%서울시 강남구%"
and b.addressDetail like "%아파트%"
;


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

-- 아이디, 비번 검색

select 
	name,
    id,
    password
from member
where 1=1
and id="yeriel"
and password="1234567aa";

select 
	name,
    id,
    password
from member
where 1=1
and id="chacha"
and password="enwsakjflajsf";

select 
	name,
    id,
    password
from member
where 1=1
and id="kangsong"
and password="songsasda";

select 
	name,
    id,
    password
from member
where 1=1
and id="yunakk"
and password="yuna1234anuy";

select 
	name,
    id,
    password
from member
where 1=1
and id="suzybae"
and password="suzy121235yzus";

select 
	name,
    id,
    password
from member
where 1=1
and id="ywyw"
and password="jangwoo1234";

select 
	name,
    id,
    password
from member
where 1=1
and id="ubini"
and password="kimubin52541";

select 
	name,
    id,
    password
from member
where 1=1
and id="Leejs"
and password="jsl5645213";

select 
	name,
    id,
    password
from member
where 1=1
and id="eunbini"
and password="EEBB463415";

select 
	name,
    id,
    password
from member
where 1=1
and id="bogum"
and password="qhrja57865";

-- 배송 zipcode: 30512, 10570, 78974

select
	a.seq
	,a.name
    ,a.id
    ,b.member_seq
    ,b.zipcode
from member a
left join transport b on b.member_seq = a.seq
where 
1=1
and b.zipcode like "30512"
;
select
	a.seq
	,a.name
    ,a.id
    ,b.member_seq
    ,b.zipcode
from member a
left join transport b on b.member_seq = a.seq
where 
1=1
and b.zipcode like "10570"
;

select
	a.seq
	,a.name
    ,a.id
    ,b.member_seq
    ,b.zipcode
from member a
left join transport b on b.member_seq = a.seq
where 
1=1
and b.zipcode like "78974"
;