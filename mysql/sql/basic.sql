-- fruit database를 사용하겠다.
USE fruit;

CREATE TABLE IF NOT EXISTS `fruit`.`member2` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `pwd` VARCHAR(45) NULL,
  `pwd2` VARCHAR(45) NULL,
  `dob` INT NULL,																		
  `gender` TINYINT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;


-- * (아스테리크) = all 모든 정보 끌고 오는 것, 그러나 필드가면 필요한 데이터만 select해야 한다.
-- 전체 컬럼 조회
-- 테이블 수정 전에 항상 꼭 !! 반드시 !! 진짜로 ER로부터 수정하기!
SELECT * FROM member;

-- 컬럼 추가
ALTER TABLE member ADD COLUMN nickname VARCHAR(45);

-- 원하는 위치 뒤에 컬럼 추가
ALTER TABLE member ADD COLUMN nameEng VARCHAR(45) AFTER name;


SELECT * FROM member2;

ALTER TABLE member2 ADD column nickname VARCHAR(45);
ALTER TABLE member2 ADD column phone VARCHAR(45) AFTER gender;
ALTER TABLE member2 ADD column phone2 VARCHAR(45) AFTER phone;

-- 컬럼 변경; 작은범위에서 큰범위가능, 큰범위에서 작은범위로 가면 데이터 짤림/ 데이터 있을 경우 변경 불가

ALTER TABLE member2 MODIFY COLUMN nickname varchar(100);
ALTER TABLE member2 MODIFY COLUMN name varchar(100);

-- 칼럼 이름 변경

ALTER TABLE member2 CHANGE COLUMN nickname nick varchar(45);
ALTER TABLE member2 CHANGE COLUMN name name varchar(45);


-- 컬럼 삭제 (삭제하기 전에 테이블을 고대로 카피해서 백업하고 삭제해야 한다)
ALTER TABLE member2 DROP COLUMN nick;

-- row 삭제
delete from member2 where seq = 2;
-- delete from, where => 먼저 쓰고 delete 테이블 where 시퀀스 지우기

delete from member where seq = 14;

-- commit / rollback

-- 데이터 수정
UPDATE member2 SET
name = "Tony"
, nameEng = "Great"
where seq = 1;

ALTER TABLE classProduct DROP COLUMN class_infomation;

-- where

SELECT * FROM member2
where 1=1
and name like 'To%' -- 앞에 있는 두글자 포함
-- and name like '%ny'   뒤에 있는 두글자 포함
-- and name like '%ny%' 빈도수 많음 가운데 있는 두글자 포함

-- 게시판 글 검색: like 검색이다. 속도는 떨어지지만 모든 데이터 like사용
 ;
SELECT * FROM member2
where 1=1
-- and delNY = 0
-- and delNY > 1
-- and delNY >= 1
-- and delNY between 0 and 1
;
SELECT * FROM member2
where 1=1
-- and nameEng is null  -> null인 데이터 뽑고 싶을 때 사용함
;

use fruit;

select * from member;
 SELECT * FROM member
where 1=1
-- and name like '%ng';
 and name like '%so%'
-- and id like '%ic%'
-- and password like '%1234%';
-- and dob like '1993%';
-- and email like '%@naver.com';
;
select * from member
where 1=1
-- and div_mobile_agree = 2
and div_personal_infomation > 3

-- and delNY > 1
-- and delNY >= 1
-- and delNY between 0 and 1
;

select * from member2;

select * from member2
where 1=1
-- and name is null;
-- and pwd is null
-- and pwd2 is null
-- and gender is null
-- and dob is null
and id is null
;

-- null 아닌 빈칸 찾고 싶을 때

select * from member2
where 1=1
and pwd = ""
;



-- order by

-- oder by
-- a. ~~~
-- a. ~~~ asc 정방향 순서
-- a. ~~~ desc 역방향 순서


-- sub select
-- a. ~~~
-- (select aa.~~~ from table~~ aa where 1=1 and aa.~~~ = ~~~~ ;) >> data 한개만 불러오고 싶을 때 사용한데, 여러개 불러올때는 join 사용하기!!!/ 
-- 알리아스 쓸때 subQuery는 하위단계이기 때문에 알파벳 2개 쓰기!

