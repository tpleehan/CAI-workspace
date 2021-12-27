/*
trigger는 테이블에 부착한 형태로 
INSERT, UPDATE, DELETE 작업이 수행될 때 특정 코드가 작동되도록 하는 구문이다.

trigger는 실행할 때 범위를 지정하고 F5버튼으로 부분실행해야 한다.
그렇지 않으면 하나의 구문으로 인식되어 정삭 동작하지 않는다.
*/

CREATE TABLE tbl_test (
    id NUMBER(10),
    text VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER trg_test
    AFTER DELETE OR UPDATE -- 삭제 혹은 수정 이후에 동작
    ON tbl_test -- 부착할 테이블 선언
    FOR EACH ROW -- 각 행에 적용
BEGIN
    DBMS_OUTPUT.PUT_LINE('트리거 동작'); -- 실행되는 코드를 begin ~ end에 넣는다.
END;

INSERT INTO tbl_test VALUES(1, '홍길동');
UPDATE tbl_test SET text = '홍길동2' WHERE id = 1;
DELETE FROM tbl_test  WHERE id = 1;


-- trigger After & before
/*
AFTER trigger - INSERT, UPDATE, DELETE 작업 이후에 동작하는 트리거를 의미한다.
BEFORE trigger - INSERT, UPDATE, DELETE 작업 이전에 동작하는 트리거를 의미한다.
INSTEAD OF trigger - INSERT, UPDATE, DELETE 작업 이전에 발생하는 트리거 이지만 VIEW만 부착할 수 있다.

:OLD = 참조 전 열의 값 (INSERT: 입력 전 자료, UPDATE: 수정 전 자료, DELETE: 삭제할 값)
:NEW = 참조 후 열의 값 (INSERT: 입력 할 자료, UPDATE: 수정 된 자료) :NEW는 DELETE가 없다.

테이블에 UPDATE나 DELETE를 시도하면 수정 또는 삭제된 데이터를
별도의 테이블에 보관해 놓는 형식으로 트리거를 사용할 수 있다.
*/

CREATE TABLE tbl_user (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(30)
);

CREATE TABLE tbl_user_backup (
    id VARCHAR2(20),
    name VARCHAR2(20),
    address VARCHAR2(30),
    update_date DATE DEFAULT sysdate, -- 변경 시간
    m_type VARCHAR2(10), -- 변경 타입
    m_user VARCHAR2(20) -- 변경한 사용자
);


-- AFTER trigger
CREATE OR REPLACE TRIGGER trg_user_backup
    AFTER UPDATE OR DELETE 
    ON tbl_user
    FOR EACH ROW
DECLARE -- 사용할 변수를 선언
    v_type VARCHAR2(10);
BEGIN
    IF UPDATING THEN -- UPDATING은 시스템 자체에서 상태에 대한 내용을 지원하는 빌트인 구문
        v_type := '수정';
    ELSIF DELETING THEN -- DELETING은 시스템 자체에서 상태에 대한 내용을 지원하는 빌트인 구문
        v_type := '삭제';
    END IF;
    
    -- 실행 구문 시작 (:OLD는 테이블 DELETE, UPDATE가 적용되기 전 기존데이터, 즉 변경 전 데이터)
    INSERT INTO tbl_user_backup
    VALUES (:OLD.id, :OLD.name, :OLD.address, sysdate, v_type, USER());
END;

-- 확인
INSERT INTO tbl_user VALUES('test01', 'admin', '서울');
INSERT INTO tbl_user VALUES('test02', 'admin', '경기');
INSERT INTO tbl_user VALUES('test03', 'admin', '부산');

SELECT * FROM tbl_user;
SELECT * FROM tbl_user_backup;

UPDATE tbl_user SET address = '인천' WHERE id = 'test01';

-- BEFORE trigger
CREATE OR REPLACE TRIGGER trg_user_insert
    BEFORE INSERT
    ON tbl_user
    FOR EACH ROW
BEGIN
    :NEW.name := SUBSTR(:NEW.name, 1, 1) || '**';
END;

INSERT INTO tbl_user VALUES('test04', '홍길동', '대구');

SELECT * FROM tbl_user;


/*
- 트리거의 활용
INSERT -> 주문테이블 -> 주문테이블 INSERT 트리거 실행 (물품 테이블 update)
*/

-- 주문 히스토리
CREATE TABLE order_history (
    history_no NUMBER(5) PRIMARY KEY,
    order_no NUMBER (5),
    product_no NUMBER(5),
    total NUMBER(10),
    price NUMBER(10)
);

-- 상품
CREATE TABLE product (
    product_no NUMBER(5) PRIMARY KEY,
    product_name VARCHAR2(20),
    total NUMBER(5),
    price NUMBER(5)
);

CREATE SEQUENCE order_history_seq NOCACHE;
CREATE SEQUENCE product_seq NOCACHE;

INSERT INTO product VALUES(product_seq.NEXTVAL, '피자', 100, 10000);
INSERT INTO product VALUES(product_seq.NEXTVAL, '치킨', 100, 15000);
INSERT INTO product VALUES(product_seq.NEXTVAL, '햄버거', 100, 5000);

-- 주문 히스토리에 데이터가 들어오면 실행
CREATE OR REPLACE TRIGGER trg_order_history
    AFTER INSERT
    ON order_history
    FOR EACH ROW 
DECLARE
    v_total NUMBER;
    v_product_no NUMBER;
BEGIN 
    DBMS_OUTPUT.PUT_LINE('트리거 실행');
    SELECT :NEW.total
    INTO v_total
    FROM dual;
    
    v_product_no := :NEW.product_no;
    
    UPDATE product SET total = total - v_total
    WHERE product_no = v_product_no;
    
END;

INSERT INTO order_history VALUES(order_history_seq.NEXTVAL, 200, 1, 5, 50000);
INSERT INTO order_history VALUES(order_history_seq.NEXTVAL, 200, 2, 1, 15000);
INSERT INTO order_history VALUES(order_history_seq.NEXTVAL, 200, 3, 10, 50000);

SELECT * FROM order_history;
SELECT * FROM product;
