/* USER 생성 (관리자 계정으로 실행) */

--CREATE USER CODETREE IDENTIFIED BY CODETREE;
--GRANT CONNECT, RESOURCE TO CODETREE;


/* CODETREE 계정으로 실행 */

DROP TABLE MEMBER;
DROP TABLE BOARD;
DROP TABLE ADDRESS;

DROP SEQUENCE SEQ_UNO;
DROP SEQUENCE SEQ_BNO;


/* Member */
CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(15) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    GENDER  VARCHAR2(3),
    BIRTHDAY    DATE,
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(100) NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.GENDER IS '성별(남/여/NULL)';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '생년월일';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';
COMMENT ON COLUMN MEMBER.STATUS IS '회원 상태(Y/N)';

CREATE SEQUENCE SEQ_UNO
NOCACHE;

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', NULL, '1999-10-31', '010-1111-2222', 'admin@cd.or.kr', '2022-02-10', '2022-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user1', '1234', '홍길동', '남', '1999-10-31', '010-1131-1978', 'gildong@cd.or.kr', '2023-02-10', '2023-02-10', 'Y');

INSERT INTO MEMBER
VALUES (SEQ_UNO.NEXTVAL, 'user2', '1234', '콩쥐', '여', '1999-10-31', NULL, 'congcong@cd.or.kr', '2024-10-02', '2024-10-02', 'Y');


/* Board */
CREATE TABLE BOARD (
    BOARD_NO      NUMBER         PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100)    NOT NULL,
    BOARD_TYPE  VARCHAR(10) NOT NULL,
    BOARD_CATEGORY  VARCHAR2(15),
    BOARD_CONTENT   VARCHAR(500)    NOT NULL,
    PROD_IMG    VARCHAR(300),
    PRICE   INT NOT NULL,
    BID_PRICE   INT,
    STOCK   INT NOT NULL,
    SELLER_NO  int,
    REGISTER_DATE DATE    DEFAULT SYSDATE,
    END_DATE    DATE,
    STATUS  CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글 번호';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글 제목';
COMMENT ON COLUMN BOARD.BOARD_TYPE IS '판매 타입(경매/중고거래)';
COMMENT ON COLUMN BOARD.BOARD_CATEGORY IS '게시글 카테고리';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '게시글 내용';
COMMENT ON COLUMN BOARD.PROD_IMG IS '상품 이미지';
COMMENT ON COLUMN BOARD.PRICE IS '상품 가격(즉시 낙찰가)';
COMMENT ON COLUMN BOARD.BID_PRICE IS '경매 가격(현재 입찰가)';
COMMENT ON COLUMN BOARD.STOCK IS '상품 수량';
COMMENT ON COLUMN BOARD.SELLER_NO IS '판매자 번호';
COMMENT ON COLUMN BOARD.REGISTER_DATE IS '판매등록일';
COMMENT ON COLUMN BOARD.END_DATE IS '판매종료일';
COMMENT ON COLUMN BOARD.STATUS IS '판매 상태(Y/N)';

CREATE SEQUENCE SEQ_BNO
NOCACHE;

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion01.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion02.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion03.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion04.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion05.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion06.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'L 브랜드 크로스백 MOLRA-505 화이트 색상', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion07.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'M 브랜드 가방 신상', '경매', 'fashion', 'M 브랜드에서 이번에 나온 신상입니다. 실착 횟수 1회. 사진만 찍고 넣어놨어요.', '/views/resources/images/prd/prd_fashion08.jpg', 10000000, 5000000, 1, 3, TO_DATE('2024-10-11 16:09:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Y');

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, 'S 브랜드 백 핑크베이지', '중고', 'fashion', '예전에 샀던 가방인데 안 써서 팔아요. 바닥에 기스가 조금 있긴한데 깨끗해요.', '/views/resources/images/prd/prd_fashion09.jpg', 17000000, 0, 1, 3, TO_DATE('2024-10-11 17:07:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-10-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS'), 'Y'); 


/* Address */
CREATE TABLE ADDRESS (
    USER_NO NUMBER ,
    ADDRESS_NAME    VARCHAR2(30)    NOT NULL    UNIQUE,
    RECEIVER    VARCHAR2(30)    NOT NULL,
    DELIVERY_ADDRESS    VARCHAR2(300)   NOT NULL,
    POST_CODE   NUMBER  NOT NULL,
    PHONE   VARCHAR2(13)   NOT NULL
);

COMMENT ON COLUMN ADDRESS.USER_NO IS '회원번호';
COMMENT ON COLUMN ADDRESS.ADDRESS_NAME IS '배송지 이름';
COMMENT ON COLUMN ADDRESS.RECEIVER IS '받는이';
COMMENT ON COLUMN ADDRESS.DELIVERY_ADDRESS IS '배송주소';
COMMENT ON COLUMN ADDRESS.POST_CODE IS '우편번호';
COMMENT ON COLUMN ADDRESS.PHONE IS '전화번호';

COMMIT;