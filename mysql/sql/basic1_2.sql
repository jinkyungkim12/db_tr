create schema fruit;

use fruit;

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


-- transport
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	30512
    ,"서울시 은평구 녹번동"
    ,1
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	10570
    ,"서울시 마포구 공덕동"
    ,1
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	30512
    ,"서울시 영등포구 여의도동"
    ,1
)
;

INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	30512
    ,"서울시 서대문구 홍은동"
    ,7
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	10570
    ,"서울시 마포구 연남동"
    ,7
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	30512
    ,"서울시 구로구 신도림동"
    ,7
)
;

INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	30512
    ,"서울시 강남구 개포동"
    ,3
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	10570
    ,"서울시 강남구 역삼동"
    ,3
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	30512
    ,"서울시 강남구 신사동"
    ,3
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	45631
    ,"서울시 양천구 목동"
    ,2
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	45631
    ,"서울시 마포구 창천동"
    ,2
)
;
INSERT INTO transport(
	zipcode
    ,address
    ,member_seq
    )
VALUE (
	12454
    ,"서울시 마포구 구수동"
    ,2
)
;



-- classOrder
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	2860000
    ,114400
    ,0
    ,171600
    ,1
    ,"none"
    ,1
    ,1
    ,1
)
;
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	2860000
    ,114400
    ,0
    ,171600
    ,1
    ,"none"
    ,1
    ,7
    ,4
)
;
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	2860000
    ,114400
    ,0
    ,171600
    ,1
    ,"none"
    ,1
    ,3
    ,8
)
;

INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	234700
    ,44593
    ,10000
    ,180107
    ,1
    ,"none"
    ,2
    ,7
    ,5
)
;
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	234700
    ,44593
    ,0
    ,190107
    ,1
    ,"none"
    ,2
    ,3
    ,9
)
;
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	234700
    ,44593
    ,20000
    ,170107
    ,1
    ,"none"
    ,2
    ,1
    ,2
)
;

INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	249000
    ,39840
    ,10000
    ,199160
    ,1
    ,"none"
    ,3
    ,7
    ,4
)
;
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	249000
    ,39840
    ,0
    ,209160
    ,1
    ,"none"
    ,3
    ,3
    ,7
)
;
INSERT INTO classOrder(
	price
    ,priceDiscount
    ,CouponDiscount
    ,finalPrice
    ,pay
    ,Request
    ,classProduct_seq
    ,member_seq
    ,transport_seq
    )
VALUE (
	249000
    ,39840
    ,40000
    ,159160
    ,2
    ,"none"
    ,3
    ,1
    ,1
)
;

select * from review;
select * from member;
select * from classProduct;
select * from transport;
select * from classOrder;
 

CREATE TABLE IF NOT EXISTS `fruit`.`CommonCodeGroup` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `UseNY` INT NULL,
  `DelNY` INT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `fruit`.`CommonCode` (
  `seq` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `useNY` INT NULL,
  `delNY` INT NULL,
  `Common Code Group_seq` INT NOT NULL,
  PRIMARY KEY (`seq`),
  INDEX `fk_Common Code_Common Code Group1_idx` (`Common Code Group_seq` ASC) VISIBLE,
  CONSTRAINT `fk_Common Code_Common Code Group1`
    FOREIGN KEY (`Common Code Group_seq`)
    REFERENCES `fruit`.`CommonCodeGroup` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;


select * from CommonCodeGroup;
select * from CommonCode;

select * from member;
select * from classProduct;
select * from classOrder;
select * from review;
select * from transport;

-- like 테이블 만들어서 누가 좋아요 눌렀는지 볼 수 있게 하기
-- 관리자용 member 테이블 만들기