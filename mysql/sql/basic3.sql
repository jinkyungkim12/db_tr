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


