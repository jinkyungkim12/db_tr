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

-- 칼럼 이름 변경

ALTER TABLE member2 CHANGE COLUMN nickname nick varchar(45);



 