create schema fruit;

use fruit;


CREATE TABLE IF NOT EXISTS `fruit`.`class` (
  `seq` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL COMMENT '강의카테고리',
  `title` VARCHAR(45) NOT NULL COMMENT '강의제목',
  `discount_rate` INT NOT NULL COMMENT '할인률',
  `price` INT NOT NULL COMMENT '구매가격',
  `dateTime_discount` DATETIME NOT NULL COMMENT '할인적용가능 날짜 및 시간',
  `price_discount` TINYINT NOT NULL COMMENT '총 할인액',
  `class_information` VARCHAR(45) NOT NULL COMMENT '클래스 정보',
  `class_amount` VARCHAR(45) NOT NULL COMMENT '클래스 분량',
  `date_available` VARCHAR(45) NOT NULL COMMENT '수강 가능일',
  `subtitle` TINYINT NOT NULL COMMENT '자막 포함 여부',
  `content_class` VARCHAR(45) NOT NULL COMMENT '강의 상세 페이지',
  `curriculum` VARCHAR(45) NOT NULL COMMENT '커리큘럼',
  `title_curriculum` VARCHAR(45) NOT NULL COMMENT '커리큘럼 소제목',
  `list_curriculum` VARCHAR(45) NOT NULL COMMENT '커리큘럼 목차',
  `kit_information` VARCHAR(45) NOT NULL COMMENT '키트 소개',
  `creator_information` VARCHAR(45) NOT NULL COMMENT '크리에이터 소개글',
  `FAQ` VARCHAR(45) NOT NULL COMMENT '자주 묻는 질문',
  `refund` VARCHAR(45) NOT NULL COMMENT '환불정책',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`review` (
  `seq` INT NOT NULL,
  `review_amount` INT NOT NULL COMMENT '클래스 한줄평 갯수',
  `preference_rate` TINYINT NOT NULL COMMENT '수강생 만족도',
  `total_review` INT NOT NULL COMMENT '총 수강생 후기 갯수',
  `id` VARCHAR(45) NOT NULL COMMENT '작성자 아이디',
  `preference_star` TINYINT NOT NULL COMMENT '별점',
  `date` DATE NOT NULL COMMENT '작성 날짜',
  `class_progress_rate` TINYINT NOT NULL COMMENT '작성자 수강 진행률',
  `content` VARCHAR(45) NOT NULL COMMENT '작성 내용',
  `comment` INT NOT NULL COMMENT '댓글',
  `like` INT NOT NULL COMMENT '좋아요',
  INDEX `fk_review_class101_DetailView1_idx` (`seq` ASC) VISIBLE,
  PRIMARY KEY (`seq`),
  CONSTRAINT `fk_review_class101_DetailView1`
    FOREIGN KEY (`seq`)
    REFERENCES `fruit`.`class` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`transport` (
  `seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_transport_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_transport_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`mypage` (
  `seq` INT NOT NULL,
  `coupon` INT NOT NULL,
  `cash` INT NOT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`class_option` (
  `seq` INT NOT NULL,
  `div` TINYINT NOT NULL COMMENT '1: 강의, 2: 강의 + 아이패드',
  `class_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_class_option_class1_idx` (`class_seq` ASC) VISIBLE,
  CONSTRAINT `fk_class_option_class1`
    FOREIGN KEY (`class_seq`)
    REFERENCES `fruit`.`class` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`wish` (
  `seq` INT NOT NULL,
  `class_seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_wish_class1_idx` (`class_seq` ASC) VISIBLE,
  INDEX `fk_wish_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_wish_class1`
    FOREIGN KEY (`class_seq`)
    REFERENCES `fruit`.`class` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wish_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`order` (
  `seq` INT NOT NULL,
  `class_seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  `transport_seq` INT NOT NULL,
  `order_class_seq` INT NOT NULL,
  `mypage_seq` INT NOT NULL,
  `price` INT NOT NULL COMMENT '결제 금액',
  `total_price` INT NOT NULL COMMENT '총 상품 금액',
  `price_discount` INT NOT NULL COMMENT '상품 할인 금액',
  `price_coupon_discount` TINYINT NOT NULL COMMENT '쿠폰 할인 금액',
  `price_order` INT NOT NULL COMMENT '최종가격',
  `order_option` TINYINT NOT NULL COMMENT '결제 방식',
  PRIMARY KEY (`seq`),
  INDEX `fk_order_class1_idx` (`class_seq` ASC) VISIBLE,
  INDEX `fk_order_member1_idx` (`member_seq` ASC) VISIBLE,
  INDEX `fk_order_transport1_idx` (`transport_seq` ASC) VISIBLE,
  INDEX `fk_order_mypage1_idx` (`mypage_seq` ASC) VISIBLE,
  CONSTRAINT `fk_order_class1`
    FOREIGN KEY (`class_seq`)
    REFERENCES `fruit`.`class` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_transport1`
    FOREIGN KEY (`transport_seq`)
    REFERENCES `fruit`.`transport` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_mypage1`
    FOREIGN KEY (`mypage_seq`)
    REFERENCES `fruit`.`mypage` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`member` (
  `seq` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL COMMENT '이름',
  `id` VARCHAR(45) NOT NULL COMMENT '아이디',
  `password` VARCHAR(45) NOT NULL COMMENT '비밀번호',
  `password2` VARCHAR(45) NOT NULL COMMENT '비밀번호 확인',
  `dob` DATE NOT NULL COMMENT '생년월일',
  `gender` TINYINT NOT NULL COMMENT '성별',
  `phone` VARCHAR(45) NOT NULL COMMENT '연락처',
  `phone2` VARCHAR(45) NOT NULL COMMENT '연락처2',
  `email` VARCHAR(45) NOT NULL COMMENT '이메일',
  `address` VARCHAR(45) NOT NULL COMMENT '주소',
  `div_mobile_agree` TINYINT NOT NULL COMMENT '모바일 수신 1: 동의, 2: 비동의',
  `div_email_agree` TINYINT NOT NULL COMMENT '이메일 수신 1: 동의, 2: 비동의',
  `div_personal_infomation` TINYINT NOT NULL COMMENT '개인정보 유효기간 1: 1년, 2: 3년, 3: 10년, 4: 평생회원',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`orderOption` (
  `seq` INT NOT NULL,
  `order_seq` INT NOT NULL,
  `class_option_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_table1_order1_idx` (`order_seq` ASC) VISIBLE,
  INDEX `fk_table1_class_option1_idx` (`class_option_seq` ASC) VISIBLE,
  CONSTRAINT `fk_table1_order1`
    FOREIGN KEY (`order_seq`)
    REFERENCES `fruit`.`order` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_class_option1`
    FOREIGN KEY (`class_option_seq`)
    REFERENCES `fruit`.`class_option` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`Like` (
  `seq` INT NOT NULL,
  `class_seq` INT NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_Like_class1_idx` (`class_seq` ASC) VISIBLE,
  CONSTRAINT `fk_Like_class1`
    FOREIGN KEY (`class_seq`)
    REFERENCES `fruit`.`class` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;



INSERT INTO member(
	seq
	,name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    )
VALUE (
	3
	,"jinkyung"
    ,"yeriel"
    ,"1234567aa"
    ,"1234567aa"
    ,"19930507"
    ,1
)
;

SELECT
	seq
    ,name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
FROM member
WHERE
	seq = 3
    and gender = 1
    and password= "1234567aa"
;

use fruit;

drop table wish;
drop table review;
drop table classOption;
drop table classProduct;
drop table oderOption;
drop table member2;
drop table classOrder;
drop table mypage;
drop table transport;
drop table member;
drop table oderOption;
drop table orderOption;


use fruit;

 CREATE TABLE IF NOT EXISTS `fruit`.`member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL COMMENT '이름',
  `id` VARCHAR(45) NULL COMMENT '아이디',
  `password` VARCHAR(45) NULL COMMENT '비밀번호',
  `password2` VARCHAR(45) NULL COMMENT '비밀번호 확인',
  `dob` DATE NULL COMMENT '생년월일',
  `gender` TINYINT NULL COMMENT '성별',
  `phone` VARCHAR(45) NULL COMMENT '연락처',
  `phone2` VARCHAR(45) NULL COMMENT '연락처2',
  `email` VARCHAR(45) NULL COMMENT '이메일',
  `address` VARCHAR(45) NULL COMMENT '주소',
  `div_mobile_agree` TINYINT NULL COMMENT '모바일 수신 1: 동의, 2: 비동의',
  `div_email_agree` TINYINT NULL COMMENT '이메일 수신 1: 동의, 2: 비동의',
  `div_personal_infomation` TINYINT NULL COMMENT '개인정보 유효기간 1: 1년, 2: 3년, 3: 10년, 4: 평생회원',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`classOrder` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `order_class_seq` INT NULL,
  `id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `zipcode` INT NULL,
  `address` VARCHAR(45) NULL,
  `addressRequest` VARCHAR(45) NULL,
  `price` INT NULL COMMENT '결제 금액',
  `total_price` INT NULL COMMENT '총 상품 금액',
  `price_discount` INT NULL COMMENT '상품 할인 금액',
  `price_coupon_discount` TINYINT NULL COMMENT '쿠폰 할인 금액',
  `price_order` INT NULL COMMENT '최종가격',
  `order_option` TINYINT NULL COMMENT '결제 방식',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `fruit`.`classProduct` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL COMMENT '강의카테고리',
  `title` VARCHAR(45) NULL COMMENT '강의제목',
  `discount_rate` INT NULL COMMENT '할인률',
  `price` INT NULL COMMENT '구매가격',
  `dateTime_discount` DATETIME NULL COMMENT '할인적용가능 날짜 및 시간',
  `price_discount` TINYINT NULL COMMENT '총 할인액',
  `class_information` VARCHAR(45) NULL COMMENT '클래스 정보',
  `class_amount` VARCHAR(45) NULL COMMENT '클래스 분량',
  `date_available` VARCHAR(45) NULL COMMENT '수강 가능일',
  `subtitle` TINYINT NULL COMMENT '자막 포함 여부',
  `content_class` VARCHAR(45) NULL COMMENT '강의 상세 페이지',
  `curriculum` VARCHAR(45) NULL COMMENT '커리큘럼',
  `title_curriculum` VARCHAR(45) NULL COMMENT '커리큘럼 소제목',
  `list_curriculum` VARCHAR(45) NULL COMMENT '커리큘럼 목차',
  `kit_information` VARCHAR(45) NULL COMMENT '키트 소개',
  `creator_information` VARCHAR(45) NULL COMMENT '크리에이터 소개글',
  `FAQ` VARCHAR(45) NULL COMMENT '자주 묻는 질문',
  `refund` VARCHAR(45) NULL COMMENT '환불정책',
  `member_seq` INT NOT NULL,
  `classOrder_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_classProduct_member1_idx` (`member_seq` ASC) VISIBLE,
  INDEX `fk_classProduct_classOrder1_idx` (`classOrder_seq` ASC) VISIBLE,
  CONSTRAINT `fk_classProduct_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classProduct_classOrder1`
    FOREIGN KEY (`classOrder_seq`)
    REFERENCES `fruit`.`classOrder` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`transport` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `zipcode` INT NULL,
  `address` VARCHAR(45) NULL,
  `shippingRequest` VARCHAR(45) NULL,
  `classOrder_seq` INT NOT NULL,
  PRIMARY KEY (`seq`, `classOrder_seq`),
  INDEX `fk_transport_classOrder1_idx` (`classOrder_seq` ASC) VISIBLE,
  CONSTRAINT `fk_transport_classOrder1`
    FOREIGN KEY (`classOrder_seq`)
    REFERENCES `fruit`.`classOrder` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`review` (
  `review_amount` INT NULL COMMENT '클래스 한줄평 갯수',
  `preference_rate` TINYINT NULL COMMENT '수강생 만족도',
  `total_review` INT NULL COMMENT '총 수강생 후기 갯수',
  `id` VARCHAR(45) NULL COMMENT '작성자 아이디',
  `preference_star` TINYINT NULL COMMENT '별점',
  `date` DATE NULL COMMENT '작성 날짜',
  `class_progress_rate` TINYINT NULL COMMENT '작성자 수강 진행률',
  `content` VARCHAR(45) NULL COMMENT '작성 내용',
  `comment` INT NULL COMMENT '댓글',
  `like` INT NULL COMMENT '좋아요',
  `classProduct_seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  INDEX `fk_review_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  INDEX `fk_review_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_review_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`wish` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `wishamount` INT NULL,
  `classProduct_seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_wish_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  INDEX `fk_wish_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_wish_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wish_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`orderOption` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `classProduct_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_orderOption_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  CONSTRAINT `fk_orderOption_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`classOption` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `div` TINYINT NULL COMMENT '1: 강의, 2: 강의 + 아이패드',
  `classProduct_seq` INT NOT NULL,
  `orderOption_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_classOption_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  INDEX `fk_classOption_orderOption1_idx` (`orderOption_seq` ASC) VISIBLE,
  CONSTRAINT `fk_classOption_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classOption_orderOption1`
    FOREIGN KEY (`orderOption_seq`)
    REFERENCES `fruit`.`orderOption` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;


INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,address
    ,div_mobile_agree
    ,div_email_agree
    ,div_personal_infomation
    )
VALUE (
	"jinkyung"
    ,"yeriel"
    ,"1234567aa"
    ,"1234567aa"
    ,"19930507"
    ,1
    ,"01012341234"
    ,"01012341234"
    ,"example@naver.com"
    ,"서울시 강남구"
    ,1
    ,2
    ,2
)
;

INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("kang", "nickname1", "1234567a1", "1234567a1", "2000.01.01", 1, "01012341231", "01012341231", "example1@naver.com", "서울시 강남구 1동", 1, 1, 1)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("kim", "nickname2", "1234567a2", "1234567a2", "2000.01.02", 1, "01012341232", "01012341232", "example2@naver.com", "서울시 강남구 2동", 1, 1, 2)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("Lee", "nickname3", "1234567a3", "1234567a3", "2000.01.03", 2, "01012341233", "01012341233", "example3@naver.com", "서울시 강남구 3동", 1, 2, 2)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("Park", "nickname4", "1234567a4", "1234567a4", "2000.01.04", 2, "01012341235", "01012341235", "example4@naver.com", "서울시 강남구 4동", 1, 2, 3)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("song", "nickname5", "1234567a5", "1234567a5", "2000.01.05", 1, "01012341236", "01012341236", "example5@naver.com", "서울시 강남구 5동", 1, 1, 3)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("cho", "nickname6", "1234567a6", "1234567a6", "2000.01.06", 2, "01012341237", "01012341237", "example6@naver.com", "서울시 강남구 6동", 2, 2, 1)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("ko", "nickname7", "1234567a7", "1234567a7", "2000.01.07", 2, "01012341238", "01012341238", "example7@naver.com", "서울시 강남구 7동", 2, 1, 4)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("yoon", "nickname8", "1234567a8", "1234567a8", "2000.01.08", 1, "01012341239", "01012341239", "example8@naver.com", "서울시 강남구 8동", 1, 2, 2)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("jang", "nickname9", "1234567a9", "1234567a9", "2000.01.09", 1, "01012341240", "01012341240", "example9@naver.com", "서울시 강남구 9동", 2, 2, 3)
;

SELECT * FROM member
;

SELECT 
	seq
    ,name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,address
    ,div_mobile_agree
    ,div_email_agree
    ,div_personal_infomation
    
FROM member
WHERE 1=1
	-- and seq = 21
	-- and name = "jinkyung"
    -- and id = "yeriel"
    -- and password = "1234567aa"
    ;

select * from member;    

INSERT INTO classOrder(id, name, phone, address)
VALUE ("nickname3", "Lee", "01012341233", "서울시 강남구 3동")
;
INSERT INTO classOrder(id, name, phone, address)
VALUE ("nickname7", "ko", "01012341238", "서울시 강남구 7동")
;
INSERT INTO classOrder(id, name, phone, address)
VALUE ("nickname8", "yoon", "01012341239", "서울시 강남구 8동")
;

SELECT * from classOrder;

INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname3", "Lee", "01012341233", "서울시 강남구 3동",1)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname3", "Lee", "01012341233", "서울시 강남구 3동",1)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname3", "Lee", "01012341233", "서울시 강남구 3동",1)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname7", "ko", "01012341238", "서울시 강남구 7동",2)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname7", "ko", "01012341238", "서울시 강남구 7동",2)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname7", "ko", "01012341238", "서울시 강남구 7동",2)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname8", "yoon", "01012341239", "서울시 강남구 8동",3)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname8", "yoon", "01012341239", "서울시 강남구 8동",3)
;
INSERT INTO transport(id, name, phone, address, classOrder_seq)
VALUE ("nickname8", "yoon", "01012341239", "서울시 강남구 8동",3)
;

SELECT * from transport;

INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,17,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,22,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,1)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,2)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,3)
;
INSERT INTO classProduct(category, title, discount_rate, price, member_seq, classOrder_seq)
VALUE ("category1", "title1", "30",10000,23,3)
;
SELECT * from classProduct;

INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("jang", "너무 재밌는 수업입니다.", 5, 75, 23, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("jang", "유용한 수업입니다.", 5, 75, 23, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("jang", "수익화 성공했습니다!.", 5, 75, 23, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("yoon", "이모티콘 만들기 너무 어려워요.", 4, 55, 22, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("yoon", "활용성이 높은 점이 마음에 듭니다.", 4, 55, 22, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("yoon", "수익화 성공했습니다!.", 4, 55, 22, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("Lee", "활용성이 높은 점이 마음에 듭니다.", 4, 55, 17, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("Lee", "수업이 재밌습니다!", 4, 55, 17, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("Lee", "이모티콘 만들기로 하루종일 시간을 보낼정도로 재밌어요.", 4, 55, 17, 2)
;

SELECT * from review;

DROP TABLE review;

CREATE TABLE IF NOT EXISTS `fruit`.`review` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL COMMENT '작성자 아이디',
  `preference_star` TINYINT NULL COMMENT '별점',
  `date` DATE NULL COMMENT '작성 날짜',
  `class_progress_rate` TINYINT NULL COMMENT '작성자 수강 진행률',
  `content` VARCHAR(45) NULL COMMENT '작성 내용',
  `comment` INT NULL COMMENT '댓글',
  `like` INT NULL COMMENT '좋아요',
  `classProduct_seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_review_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  INDEX `fk_review_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_review_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("jang", "너무 재밌는 수업입니다.", 5, 75, 23, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("jang", "유용한 수업입니다.", 5, 75, 23, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("jang", "수익화 성공했습니다!.", 5, 75, 23, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("yoon", "이모티콘 만들기 너무 어려워요.", 4, 55, 22, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("yoon", "활용성이 높은 점이 마음에 듭니다.", 4, 55, 22, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("yoon", "수익화 성공했습니다!.", 4, 55, 22, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("Lee", "활용성이 높은 점이 마음에 듭니다.", 4, 55, 17, 2)
;
INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("Lee", "수업이 재밌습니다!", 4, 55, 17, 2)
;

INSERT INTO review(id, content, preference_star, class_progress_rate, member_seq, classProduct_seq)
VALUE ("Lee", "이모티콘 만들기로 하루종일 시간을 보낼정도로 재밌어요.", 4, 55, 17, 2)
;

SELECT * from review;


use fruit;

CREATE TABLE IF NOT EXISTS `fruit`.`member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL COMMENT '이름',
  `id` VARCHAR(45) NULL COMMENT '아이디',
  `password` VARCHAR(45) NULL COMMENT '비밀번호',
  `password2` VARCHAR(45) NULL COMMENT '비밀번호 확인',
  `dob` DATE NULL COMMENT '생년월일',
  `gender` TINYINT NULL COMMENT '성별',
  `phone` VARCHAR(45) NULL COMMENT '연락처',
  `phone2` VARCHAR(45) NULL COMMENT '연락처2',
  `email` VARCHAR(45) NULL COMMENT '이메일',
  `address` VARCHAR(45) NULL COMMENT '주소',
  `div_mobile_agree` TINYINT NULL COMMENT '모바일 수신 1: 동의, 2: 비동의',
  `div_email_agree` TINYINT NULL COMMENT '이메일 수신 1: 동의, 2: 비동의',
  `div_personal_infomation` TINYINT NULL COMMENT '개인정보 유효기간 1: 1년, 2: 3년, 3: 10년, 4: 평생회원',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `fruit`.`classProduct` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL COMMENT '강의카테고리',
  `title` VARCHAR(45) NULL COMMENT '강의제목',
  `discountRate` INT NULL COMMENT '할인률',
  `price` INT NULL COMMENT '구매가격',
  `priceDiscount` TINYINT NULL COMMENT '총 할인액',
  `classAmount` VARCHAR(45) NULL COMMENT '클래스 분량',
  `dateAvailable` VARCHAR(45) NULL COMMENT '수강 가능일',
  `subtitle` TINYINT NULL COMMENT '자막 포함 여부 1: 포함 2: 불포함',
  `classInfo` VARCHAR(45) NULL COMMENT '클래스 소개',
  `curriculum` VARCHAR(45) NULL COMMENT '커리큘럼',
  `kitInfo` VARCHAR(45) NULL COMMENT '키트 소개',
  `refund` VARCHAR(45) NULL COMMENT '환불정책',
  `member_seq` INT NOT NULL,
  `classOrder_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_classProduct_member_idx` (`member_seq` ASC) VISIBLE,
  INDEX `fk_classProduct_classOrder1_idx` (`classOrder_seq` ASC) VISIBLE,
  CONSTRAINT `fk_classProduct_member`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classProduct_classOrder1`
    FOREIGN KEY (`classOrder_seq`)
    REFERENCES `fruit`.`classOrder` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`review` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL COMMENT '작성자 아이디',
  `preference_star` TINYINT NULL COMMENT '별점',
  `date` DATE NULL COMMENT '작성 날짜',
  `class_progress_rate` TINYINT NULL COMMENT '작성자 수강 진행률',
  `content` VARCHAR(45) NULL COMMENT '작성 내용',
  `comment` INT NULL COMMENT '댓글',
  `like` INT NULL COMMENT '좋아요',
  `member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_review_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`classOrder` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `orderClass_seq` INT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `zipcode` INT NULL,
  `address` VARCHAR(45) NULL,
  `addressRequest` VARCHAR(45) NULL,
  `totalPrice` INT NULL COMMENT '총 상품 금액',
  `priceDiscount` INT NULL COMMENT '상품 할인 금액',
  `CouponDiscount` TINYINT NULL COMMENT '쿠폰 할인 금액',
  `finalPrice` INT NULL COMMENT '최종가격',
  `order_option` TINYINT NULL COMMENT '결제 방식\n1: 카카오페이 2: 무통장입금',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;
CREATE TABLE IF NOT EXISTS `fruit`.`transport` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `phone` INT NULL,
  `zipcode` INT NULL,
  `address` VARCHAR(45) NULL,
  `shippingRequest` VARCHAR(45) NULL,
  `classOrder_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_transport_classOrder1_idx` (`classOrder_seq` ASC) VISIBLE,
  CONSTRAINT `fk_transport_classOrder1`
    FOREIGN KEY (`classOrder_seq`)
    REFERENCES `fruit`.`classOrder` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`orderOption` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `classProduct_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_orderOption_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  CONSTRAINT `fk_orderOption_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `fruit`.`classOption` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `classOption` TINYINT NULL COMMENT '1: 강의, 2: 강의 + 아이패드',
  `orderOption_seq` INT NOT NULL,
  `classProduct_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_classOption_orderOption1_idx` (`orderOption_seq` ASC) VISIBLE,
  INDEX `fk_classOption_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  CONSTRAINT `fk_classOption_orderOption1`
    FOREIGN KEY (`orderOption_seq`)
    REFERENCES `fruit`.`orderOption` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classOption_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `fruit`.`member2` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `pwd` VARCHAR(45) NULL,
  `pwd2` VARCHAR(45) NULL,
  `dob` INT NULL,
  `gender` TINYINT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB;

-- member

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,address
    ,div_mobile_agree
    ,div_email_agree
    ,div_personal_infomation
    )
VALUE (
	"jinkyung"
    ,"yeriel"
    ,"1234567aa"
    ,"1234567aa"
    ,"19930507"
    ,1
    ,"01012341234"
    ,"01012341234"
    ,"example@naver.com"
    ,"서울시 강남구"
    ,1
    ,2
    ,2
)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("kang", "nickname1", "1234567a1", "1234567a1", "2000.01.01", 1, "01012341231", "01012341231", "example1@naver.com", "서울시 강남구 1동", 1, 1, 1)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("kim", "nickname2", "1234567a2", "1234567a2", "2000.01.02", 1, "01012341232", "01012341232", "example2@naver.com", "서울시 강남구 2동", 1, 1, 2)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("Lee", "nickname3", "1234567a3", "1234567a3", "2000.01.03", 2, "01012341233", "01012341233", "example3@naver.com", "서울시 강남구 3동", 1, 2, 2)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("Park", "nickname4", "1234567a4", "1234567a4", "2000.01.04", 2, "01012341235", "01012341235", "example4@naver.com", "서울시 강남구 4동", 1, 2, 3)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("song", "nickname5", "1234567a5", "1234567a5", "2000.01.05", 1, "01012341236", "01012341236", "example5@naver.com", "서울시 강남구 5동", 1, 1, 3)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("cho", "nickname6", "1234567a6", "1234567a6", "2000.01.06", 2, "01012341237", "01012341237", "example6@naver.com", "서울시 강남구 6동", 2, 2, 1)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("ko", "nickname7", "1234567a7", "1234567a7", "2000.01.07", 2, "01012341238", "01012341238", "example7@naver.com", "서울시 강남구 7동", 2, 1, 4)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("yoon", "nickname8", "1234567a8", "1234567a8", "2000.01.08", 1, "01012341239", "01012341239", "example8@naver.com", "서울시 강남구 8동", 1, 2, 2)
;
INSERT INTO member(name, id, password, password2, dob, gender, phone, phone2, email, address, div_mobile_agree, div_email_agree, div_personal_infomation)
VALUE ("jang", "nickname9", "1234567a9", "1234567a9", "2000.01.09", 1, "01012341240", "01012341240", "example9@naver.com", "서울시 강남구 9동", 2, 2, 3)
;

select * from member;

ALTER table review change column date reviewDate datetime;
ALTER TABLE review ADD COLUMN reviewLike int AFTER comment;

-- review

insert into review (
        member_seq,
        id,
        preference_star,
        reviewDate,
        class
        content,
        comment,
        reviewLike
        )
VALUE ( 
		"1",
        "yeriel",
        5,
        "2022-02-01 11:00:00"
        "useful!"
        "2",
        2
        )
        ;
        

SELECT * from review;

use fruit;

SELECT * FROM member
;

SELECT * FROM review
;

-- review table

INSERT INTO review(
	member_seq, 
	id,
    preference_star,
    reviewDate,
    class_progress_rate,
    content,
    comment,
    reviewLike
    )
VALUE (
	8,
    "ko",
    4,
    "2022-01-01 11:00:00",
    3,
    "너무 재밌는 수업입니다.", 
    5, 
    5
    )
;
INSERT INTO review(
	member_seq, 
	id,
    preference_star,
    reviewDate,
    class_progress_rate,
    content,
    comment,
    reviewLike
    )
VALUE (
	8,
    "ko",
    5,
    "2022-07-01 11:00:00",
    4,
    "드디어 3번 만에 수익화 성공했어요!", 
    20, 
    50
    )
;
INSERT INTO review(
	member_seq, 
	id,
    preference_star,
    reviewDate,
    class_progress_rate,
    content,
    comment,
    reviewLike
    )
VALUE (
	8,
    "ko",
    5,
    "2022-08-01 10:00:00",
    5,
    "매우 유용했던 강의였습니다!", 
    2, 
    5
    )
;
INSERT INTO review(
	member_seq, 
	id,
    preference_star,
    reviewDate,
    class_progress_rate,
    content,
    comment,
    reviewLike
    )
VALUE (
	4,
    "Lee",
    5,
    "2022-01-01 10:00:00",
    2,
    "재밌습니다!", 
    1, 
    2
    )
;
INSERT INTO review(
	member_seq, 
	id,
    preference_star,
    reviewDate,
    class_progress_rate,
    content,
    comment,
    reviewLike
    )
VALUE (
	4,
    "Lee",
    5,
    "2022-04-01 10:00:00",
    4,
    "많은 수익은 얻지 못했지만 그래도 유용한 강의였습니다!", 
    10, 
    20
    )
;
INSERT INTO review(
	member_seq, 
	id,
    preference_star,
    reviewDate,
    class_progress_rate,
    content,
    comment,
    reviewLike
    )
VALUE (
	4,
    "Lee",
    5,
    "2022-08-01 10:00:00",
    5,
    "10번의 도전 끝에 수익화 성공했습니다!", 
    30, 
    200
    )
;

-- classOrder
ALTER TABLE classOrder DROP COLUMN orderClass_seq;

INSERT INTO classOrder(
	name, 
	phone,
    zipcode,
    address,
    addressRequest,
    totalPrice,
    priceDiscount,
    CouponDiscount,
    finalPrice,
    order_option
    )
VALUE (
	"Park",
    "01012341235",
    "00005",
    "서울시 강남구 4동",
    "none",
    300000,
    50000,
    10000,
    240000,
    1
    )
;
INSERT INTO classOrder(
	name, 
	phone,
    zipcode,
    address,
    addressRequest,
    totalPrice,
    priceDiscount,
    CouponDiscount,
    finalPrice,
    order_option
    )
VALUE (
	"song",
    "01012341236",
    "00006",
    "서울시 강남구 5동",
    "none",
    300000,
    50000,
    0,
    250000,
    2
    )
;
INSERT INTO classOrder(
	name, 
	phone,
    zipcode,
    address,
    addressRequest,
    totalPrice,
    priceDiscount,
    CouponDiscount,
    finalPrice,
    order_option
    )
VALUE (
	"cho",
    "01012341237",
    "00007",
    "서울시 강남구 6동",
    "none",
    300000,
    50000,
    30000,
    220000,
    1
    )
; 

select * from classOrder;
ALTER TABLE classOrder MODIFY COLUMN CouponDiscount int;
select * from member;
select * from review;

-- classProduct

select * from classProduct;

INSERT INTO classProduct(
	category, 
	title,
    discountRate,
    price,
	priceDiscount,
    classAmount,
    dateAvailable,
    subtitle,
    classInfo,
    curriculum,
    kitInfo,
    refund,
    member_seq,
    classOrder_seq
    )
    
value (
	"컨셉아트",
    "초보 그림러가 인기 작가가 되는classProduct 방법 <콕스의 독학비법서>",
    35,
    50400,
    136800,
    "13개 챕터 56개 세부강의",
    "바로 수강 가능",
    1,
    "초급자 분들을 위한 그림 독학 클래스 입니다. ~~~",
    "1. 포토샵 완전 정복 2. 초보자도 쉽게 배우는 ~~~",
    "와콤 타블렛, Huion sketch",
    "환불정책 ~~~",
    5,
	1
)
;
ALTER TABLE classProduct MODIFY COLUMN priceDiscount int;

 INSERT INTO classProduct(
	category, 
	title,
    discountRate,
    price,
	priceDiscount,
    classAmount,
    dateAvailable,
    subtitle,
    classInfo,
    curriculum,
    kitInfo,
    refund,
    member_seq,
    classOrder_seq
    )
    
value (
	"굿즈 이모티콘",
    "이모티콘 작가와 함께, 쉽게 배우는 이모티콘!",
    40,
    33800,
    117000,
    "12개 챕터 45개 세부강의",
    "바로 수강 가능",
    1,
    "초급자 분들을 위한 그림 독학 클래스 입니다. ~~~",
    "1. 포토샵 완전 정복 2. 초보자도 쉽게 배우는 ~~~",
    "와콤 타블렛, Huion sketch",
    "환불정책 ~~~",
    5,
	1
)
;

select * from classProduct;


CREATE TABLE IF NOT EXISTS `fruit`.`classProduct` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL COMMENT '강의카테고리',
  `title` VARCHAR(45) NULL COMMENT '강의제목',
  `discountRate` INT NULL COMMENT '할인률',
  `price` INT NULL COMMENT '정가',
  `payMonth` TINYINT NULL COMMENT '할부 개월',
  `classAmount` VARCHAR(45) NULL COMMENT '클래스 분량',
  `dateNY` TINYINT NULL COMMENT '수강 가능일 0: NO 1:YES',
  `subtitleNY` TINYINT NULL COMMENT '자막 포함 여부 1: 포함 0: 불포함',
  `classInfo` VARCHAR(45) NULL COMMENT '클래스 소개',
  `curriculum` VARCHAR(45) NULL COMMENT '커리큘럼',
  `kitInfo` VARCHAR(45) NULL COMMENT '키트 소개',
  `refund` VARCHAR(45) NULL COMMENT '환불정책',
  `kitNY` TINYINT NULL COMMENT '키트 포함 여부 0:없음 1:있음',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`member` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL COMMENT '이름',
  `id` VARCHAR(45) NULL COMMENT '아이디',
  `password` VARCHAR(45) NULL COMMENT '비밀번호',
  `password2` VARCHAR(45) NULL COMMENT '비밀번호 확인',
  `dob` DATE NULL COMMENT '생년월일',
  `gender` TINYINT NULL COMMENT '성별',
  `phone` VARCHAR(45) NULL COMMENT '연락처',
  `phone2` VARCHAR(45) NULL COMMENT '연락처2',
  `email` VARCHAR(45) NULL COMMENT '이메일',
  `mobileNY` TINYINT NULL COMMENT '모바일 수신 1: 동의, 0: 비동의',
  `emailNY` TINYINT NULL COMMENT '이메일 수신 1: 동의, 0: 비동의',
  `personalInfo` TINYINT NULL COMMENT '개인정보 유효기간 1: 1년, 2: 3년, 3: 10년, 4: 평생회원',
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`review` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(45) NULL COMMENT '작성 아이디',
  `preferenceStar` TINYINT NULL COMMENT '별점 1: 1점 2: 2점 3: 3점 4: 4점 5:5점',
  `reviewDate` DATE NULL COMMENT '작성 날짜',
  `classProgressRate` TINYINT NULL COMMENT '작성자 수강 진행률',
  `content` VARCHAR(45) NULL COMMENT '작성 내용',
  `comment` INT NULL COMMENT '댓글수',
  `reviewLike` INT NULL COMMENT '좋아요수',
  `classProduct_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_review_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  CONSTRAINT `fk_review_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`classOption` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `classOption` TINYINT NULL COMMENT '1: 강의, 2: 강의 + 키트',
  `classProduct_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_classOption_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  CONSTRAINT `fk_classOption_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`transport` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `zipcode` INT NULL,
  `address` VARCHAR(45) NULL,
  `member_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_transport_member1_idx` (`member_seq` ASC) VISIBLE,
  CONSTRAINT `fk_transport_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`classOrder` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `price` INT NULL COMMENT '정가',
  `priceDiscount` INT NULL COMMENT '상품 할인 금액',
  `CouponDiscount` TINYINT NULL COMMENT '쿠폰 할인 금액',
  `finalPrice` INT NULL COMMENT '최종가격',
  `pay` TINYINT NULL COMMENT '결제 방식\n1: 카카오페이 2: 무통장입금',
  `Request` VARCHAR(45) NULL COMMENT '배송요청사항',
  `classProduct_seq` INT NOT NULL,
  `member_seq` INT NOT NULL,
  `transport_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_classOrder_classProduct1_idx` (`classProduct_seq` ASC) VISIBLE,
  INDEX `fk_classOrder_member1_idx` (`member_seq` ASC) VISIBLE,
  INDEX `fk_classOrder_transport1_idx` (`transport_seq` ASC) VISIBLE,
  CONSTRAINT `fk_classOrder_classProduct1`
    FOREIGN KEY (`classProduct_seq`)
    REFERENCES `fruit`.`classProduct` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classOrder_member1`
    FOREIGN KEY (`member_seq`)
    REFERENCES `fruit`.`member` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classOrder_transport1`
    FOREIGN KEY (`transport_seq`)
    REFERENCES `fruit`.`transport` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;


-- member

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"jinkyung"
    ,"yeriel"
    ,"1234567aa"
    ,"1234567aa"
    ,"19930507"
    ,2
    ,"01012341234"
    ,"01012341235"
    ,"example@naver.com"
    ,1
    ,0
    ,2
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"차은우"
    ,"chacha"
    ,"1234567aa"
    ,"1234567aa"
    ,"1997-03-30"
    ,1
    ,"01019970330"
    ,"01019970331"
    ,"chaEuWoo@naver.com"
    ,1
    ,1
    ,4
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"송강"
    ,"kangsong"
    ,"songsasda"
    ,"songsasda"
    ,"1994-04-23"
    ,1
    ,"01019940423"
    ,"01019940424"
    ,"songKang@naver.com"
    ,0
    ,0
    ,1
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"김연아"
    ,"yunakk"
    ,"yuna1234anuy"
    ,"yuna1234anuy"
    ,"1990-09-05"
    ,2
    ,"01019900905"
    ,"01019900906"
    ,"yunaKim@naver.com"
    ,1
    ,0
    ,2
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"배수지"
    ,"suzybae"
    ,"suzy121235yzus"
    ,"suzy121235yzus"
    ,"1994-10-10"
    ,2
    ,"01019941010"
    ,"01019941212"
    ,"suzyb@naver.com"
    ,1
    ,1
    ,3
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"장우영"
    ,"ywyw"
    ,"jangwoo1234"
    ,"jangwoo1234"
    ,"1989-04-30"
    ,1
    ,"01019890430"
    ,"01019890431"
    ,"jangwooyoung@naver.com"
    ,0
    ,0
    ,2
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"김우빈"
    ,"ubini"
    ,"kimubin52541"
    ,"kimubin52541"
    ,"1989-07-16"
    ,1
    ,"01019890716"
    ,"01019890717"
    ,"Ubbbb1n@naver.com"
    ,1
    ,1
    ,4
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"이종석"
    ,"Leejs"
    ,"jsl5645213"
    ,"jsl5645213"
    ,"1989-04-26"
    ,1
    ,"01019890426"
    ,"01019890427"
    ,"handsome1234@naver.com"
    ,1
    ,0
    ,1
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"박은빈"
    ,"eunbini"
    ,"EEBB463415"
    ,"EEBB463415"
    ,"1992-08-04"
    ,1
    ,"01019920804"
    ,"01019920805"
    ,"choco1231@naver.com"
    ,1
    ,1
    ,4
)
;

INSERT INTO member(
	name
    ,id
    ,password
    ,password2
    ,dob
    ,gender
    ,phone
    ,phone2
    ,email
    ,mobileNY
    ,emailNY
    ,personalInfo
    )
VALUE (
	"박보검"
    ,"bogum"
    ,"qhrja57865"
    ,"qhrja57865"
    ,"1993-06-16"
    ,1
    ,"01019930616"
    ,"01019930616"
    ,"chocobananalover@naver.com"
    ,1
    ,1
    ,4
)
;

select * from member;
select * from classProduct;

-- classproduct

INSERT INTO classProduct(
	category
    ,title
    ,discountRate
    ,price
    ,payMonth
    ,classAmount
    ,dateNY
    ,subtitleNY
    ,classInfo
    ,curriculum
    ,kitInfo
    ,refund
    ,KitNY
    )
VALUE (
	"굿즈,이모티콘"
    ,"이모티콘 작가와 함께, 쉽게 배우는 이모티콘! (아이패드, 갤럭시탭, 타블렛 모두 OK)"
    ,40
    ,286000
    ,5
    ,"12개 챕터, 45개 세부강의"
    ,1
    ,1
    ,"초급자분들을 위한 이모티콘 제작 클래스입니다."
    ,"1. 이모티콘과 친해지기 2.필요한 것만 쏙쏙, 클립스튜디오가 그림판처럼 쉬워질 시간! ~~~"
    ,"와콤 타블렛, huion sketch"
    ,"환불 정책 ~~~"
    ,0
)
;

INSERT INTO classProduct(
	category
    ,title
    ,discountRate
    ,price
    ,payMonth
    ,classAmount
    ,dateNY
    ,subtitleNY
    ,classInfo
    ,curriculum
    ,kitInfo
    ,refund
    ,KitNY
    )
VALUE (
	"토익"
    ,"국내 1위 토익 유튜버의 '해석을 위한 문법'"
    ,19
    ,234700
    ,5
    ,"9개 챕터, 27개 세부강의"
    ,1
    ,0
    ,"초급자분들을 위한 토익문법 클래스입니다."
    ,"1. 문장의 뼈대, 문장의 형식 2.동사의 변신, 시제와 수동태 ~~~"
    ,"플래너"
    ,"환불 정책 ~~~"
    ,1
)
;

INSERT INTO classProduct(
	category
    ,title
    ,discountRate
    ,price
    ,payMonth
    ,classAmount
    ,dateNY
    ,subtitleNY
    ,classInfo
    ,curriculum
    ,kitInfo
    ,refund
    ,KitNY
    )
VALUE (
	"재태크"
    ,"똑똑한 부동산 투자 방법"
    ,16
    ,249000
    ,5
    ,"10개 챕터, 47개 세부강의"
    ,1
    ,1
    ,"초급자분들을 위한 내 집 마련 투자법 클래스입니다."
    ,"1. 왜 이리 집 사는게 힘들까요 2.내 집 마련을 위한 셀프 재무상태 진단법 ~~~"
    ,"플래너"
    ,"환불 정책 ~~~"
    ,1
)
;

select * from classProduct;
select * from member;

-- review


INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"eunbini"
    ,5
    ,"2020-01-02"
    ,2
    ,"처음듣는데 매우 재밌습니다!"
    ,3
    ,5
    ,1
)
;

INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"kangsong"
    ,5
    ,"2021-10-02"
    ,2
    ,"이모티콘 처음 만들어보는데 신나용!"
    ,10
    ,12
    ,1
)
;
INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"yeriel"
    ,5
    ,"2022-01-02"
    ,5
    ,"이모티콘 수익화 성공했습니다!"
    ,20
    ,100
    ,1
)
;

INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"suzybae"
    ,3
    ,"2020-10-02"
    ,4
    ,"토익점수가 생각보다 너무 안늘어서 속상합니다.."
    ,10
    ,50
    ,2
)
;

INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"chacha"
    ,5
    ,"2021-12-31"
    ,3
    ,"연말에 강의듣는데 재밌어요 ㅎㅎ"
    ,50
    ,1
    ,2
)
;
INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"yunakk"
    ,5
    ,"2022-11-02"
    ,5
    ,"토익 만점 받았습니다!!"
    ,100
    ,1000
    ,2
)
;

INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"ywyw"
    ,3
    ,"2019-10-02"
    ,5
    ,"재태크 공부 너무 재밌고 유용합니다"
    ,5
    ,10
    ,3
)
;
INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"bogum"
    ,5
    ,"2022-07-12"
    ,5
    ,"부동산 재태크로 10배 이상 수익 냈습니다!"
    ,1000
    ,10000
    ,3
)
;
INSERT INTO review(
	id
    ,preferenceStar
    ,reviewDate
    ,classProgressRate
    ,content
    ,comment
    ,reviewLike
    ,classProduct_seq
    )
VALUE (
	"Leejs"
    ,1
    ,"2022-11-02"
    ,5
    ,"이 강의는 사기강의입니다. 속지 마세요.."
    ,200
    ,1050
    ,3
)
;


-- 

select * from review;
select * from member;
select * from classProduct;



