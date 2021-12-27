-- 테이블 생성과 제약 조건

-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼 (주요 키) UNIQUE + NOT NULL
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음.
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.

CREATE TABLE dept2 (
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY, 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_bonus NUMBER (10), 
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

DROP TABLE dept2;

-- 테이블레벨 제약조건 (모든 열 선언 후 제약조건을 추가하는 방식)
CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_date DATE,
    date_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY (dept_no),
    CONSTRAINT dept2_deptname_uk UNIQUE (dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_deptdate_uk UNIQUE (dept_date),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))  
);

SELECT * FROM dept2;

-- 외래키(foreign key)가 부모테이블에 없다면 INSERT가 불가능.
INSERT INTO dept2
VALUES (10, 'gg', 4000, sysdate, 100000, 'M');

-- 외래키가 부모테이블에 있다면 INSERT 가능
INSERT INTO dept2
VALUES (10, 'gg', 2000, sysdate, 100000, 'M');

INSERT INTO dept2
VALUES (20, 'aa', 1800, sysdate, 100000, 'M');

INSERT INTO dept2
VALUES (30, 'gg', 1800, sysdate, 100000, 'F');

UPDATE locations
SET location_id = 4000
WHERE location_id = 1800; -- 외래키 제약 조건 위반.


SELECT * FROM locations;

-- 제약 조건 변경
-- 제약 조건은 추가, 삭제가 가능하다. 변경은 안된다.
-- 변경하려면 삭제하고 새로운 내용으로 추가해야 한다.

DROP TABLE dept2;


CREATE TABLE dept2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca NUMBER(4),
    dept_date DATE,
    date_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

-- pk 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
-- fk 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_loca_fk FOREIGN KEY (loca)
REFERENCES locations(location_id);
-- check 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));
-- UNIQUE 추가
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE (dept_name);
-- NOT NULL은 열 수정형태로 변경.
ALTER TABLE dept2 MODIFY dept_name VARCHAR2(14) NOT NULL;

-- 제약조건 삭제 (제약조건 이름으로)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;

-- 제약 조건 확인
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2'; -- 대/소문자 유의


-- 문제1.
-- 조건) M_NAME 는 가변문자형 널값을 허용하지 않음
-- 조건) M_NUM 은 숫자형 , 이름 mem_memnum_pk primary key
-- 조건) REG_DATE 는 날짜형 , 널값을 허용하지 않음 , 이름 mem_regdate_uk ) UNIQUE 키
-- 조건) GENDER 가변문자형
-- 조건) LOCA 숫자형 , 이름 mem_loca_loc_locid_fk ) foreign key 참조 locations 테이블 location_id

-- 문제2.
-- MEMBERS테이블과 LOCATIONS 테이블을 INNER JOIN 하고 m_name , m_mum , street_address , location_id 컬럼만 조회
-- m_num 기준으로 오름차순 조회

CREATE TABLE members (
    m_name VARCHAR2(20) NOT NULL,
    m_num NUMBER(3) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    reg_date DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    gender VARCHAR2(1) CHECK(gender IN('M', 'F')),
    loca NUMBER(4) CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)
    
    --CONSTRAINT mem_loca_loc_locid_fk FOREINGN KEY(loca) REFERENCES locations(location_id)
);

DESC members;

SELECT * FROM user_constraints
WHERE table_name = 'MEMBERS';

INSERT INTO members
VALUES ('AAA', 1, '18/07/01', 'M', 1800);
INSERT INTO members
VALUES ('BBB', 2, '18/07/02', 'F', 1900);
INSERT INTO members
VALUES ('CCC', 3, '18/07/03', 'M', 2000);
INSERT INTO members
VALUES ('DDD', 4, SYSDATE, 'M', 2000);

COMMIT;

SELECT * FROM members;

SELECT 
    m.m_name,
    m.m_num,
    loc.street_address,
    loc.location_id
FROM members m
JOIN locations loc
ON m.loca = loc.location_id
ORDER BY m.m_num ASC;
